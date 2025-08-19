<#
.SYNOPSIS
  Removes all updates from the list and hides them from reinstallation. Writes a log.

.PARAMETER HideList
  List of KBs to remove and hide.

.PARAMETER LogPath
  Path to the log file. Default: Documents\KB_RemoveHide_yyyyMMdd_HHmmss.log
#>

param(
  [string[]] $HideList = @("KB5001330", "KB5000842", "KB5025885", "KB5012643", "KB5013943", "KB5014019", "KB5027231", "KB5063878"),
  [string]   $LogPath
)

# ---------- Helpers ----------
$ts     = Get-Date -Format "yyyyMMdd_HHmmss"
$Log    = if ($LogPath) { $LogPath } else { Join-Path -Path ([Environment]::GetFolderPath('MyDocuments')) -ChildPath "KB_RemoveHide_$ts.log" }

function Write-Log {
  param([string]$Message, [ValidateSet("INFO","WARN","ERROR","DONE")] [string]$Level="INFO")
  $stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
  $line  = "[$stamp] [$Level] $Message"
  Add-Content -Path $Log -Value $line
  if ($Level -eq "ERROR") { Write-Host $line -ForegroundColor Red }
  elseif ($Level -eq "WARN") { Write-Host $line -ForegroundColor Yellow }
  elseif ($Level -eq "DONE") { Write-Host $line -ForegroundColor Green }
  else { Write-Host $line }
}

function Test-Admin {
  $id = [Security.Principal.WindowsIdentity]::GetCurrent()
  $p  = New-Object Security.Principal.WindowsPrincipal($id)
  return $p.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Is-RebootPending {
  return (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending") -or
         (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\Update\Auto Update\RebootRequired")
}

# ---------- Prologue ----------
if (-not (Test-Admin)) {
  Write-Log -Level ERROR -Message "Run PowerShell as Administrator. Aborting."
  exit 1
}

Write-Log "Log file: $Log"
try {
  $os = Get-ComputerInfo | Select-Object OsName, OsVersion, WindowsVersion, CsName
  Write-Log "System: $($os.OsName) $($os.OsVersion) ($($os.WindowsVersion)) on $($os.CsName)"
} catch {
  Write-Log -Level WARN -Message "Could not retrieve system information."
}

# Restore point (best effort)
try {
  Enable-ComputerRestore -Drive "C:" -ErrorAction SilentlyContinue | Out-Null
  Checkpoint-Computer -Description "Before removing KBs ($ts)" -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
  Write-Log "Restore point created."
} catch {
  Write-Log -Level WARN -Message "Failed to create restore point: $($_.Exception.Message)"
}

# ---------- Removal ----------
$removed      = @()
$notInstalled = @()
$removeErrors = @()

foreach ($kb in $HideList) {
  $kbTrim = $kb.Trim().ToUpper()
  if (-not $kbTrim.StartsWith("KB")) { $kbTrim = "KB$kbTrim" }

  # Presence check
  $installed = $false
  try {
    if (Get-HotFix -Id $kbTrim -ErrorAction SilentlyContinue) { $installed = $true }
  } catch {}
  if (-not $installed) {
    try {
      $pkg = (dism /online /get-packages) 2>$null | Select-String $kbTrim
      if ($pkg) { $installed = $true }
    } catch {}
  }

  if ($installed) {
    Write-Log "Removing $kbTrim ..."
    try {
      $args = "/uninstall /kb:$($kbTrim.TrimStart('K','B')) /quiet /norestart"
      $proc = Start-Process -FilePath "wusa.exe" -ArgumentList $args -PassThru -Wait -WindowStyle Hidden
      $code = $proc.ExitCode
      # 0 — success; 3010 — success, reboot required; 2359302 — not applicable/not found
      if ($code -in 0,3010) {
        $removed += $kbTrim
        $msg = ($code -eq 3010) ? "removed, reboot required (3010)" : "successfully removed (0)"
        Write-Log -Level DONE -Message "$kbTrim $msg"
      } elseif ($code -eq 2359302) {
        $notInstalled += $kbTrim
        Write-Log -Level WARN -Message "$kbTrim: WUSA returned 2359302 (not applicable/not found)."
      } else {
        $removeErrors += "$kbTrim (ExitCode $code)"
        Write-Log -Level ERROR -Message "$kbTrim: removal error, exit code $code."
      }
    } catch {
      $removeErrors += "$kbTrim (Exception)"
      Write-Log -Level ERROR -Message "$kbTrim: exception during removal — $($_.Exception.Message)"
    }
  } else {
    $notInstalled += $kbTrim
    Write-Log -Level WARN -Message "$kbTrim not found among installed updates."
  }
}

# ---------- Hiding ----------
$hidden      = @()
$alreadyNone = $true

try {
  Write-Log "Scanning available updates to hide..."
  $Session  = New-Object -ComObject Microsoft.Update.Session
  $Searcher = $Session.CreateUpdateSearcher()
  $Result   = $Searcher.Search("IsInstalled=0 and Type='Software'")
  foreach ($u in $Result.Updates) {
    foreach ($kb in $HideList) {
      $kbPat = ($kb.Trim().ToUpper())
      if (-not $kbPat.StartsWith("KB")) { $kbPat = "KB$kbPat" }
      if ($u.Title.ToUpper() -match $kbPat) {
        $alreadyNone = $false
        try {
          if (-not $u.IsHidden) { $u.IsHidden = $true }
          $hidden += $kbPat
          Write-Log -Level DONE -Message "Hidden: $($u.Title)"
        } catch {
          Write-Log -Level ERROR -Message "Failed to hide '$($u.Title)': $($_.Exception.Message)"
        }
      }
    }
  }
  if ($alreadyNone -and $HideList.Count -gt 0) {
    Write-Log -Level WARN -Message "No matching updates found to hide (may already be hidden or unavailable)."
  }
} catch {
  Write-Log -Level ERROR -Message "Error working with Windows Update COM API: $($_.Exception.Message)"
}

# ---------- Epilogue ----------
$pending = Is-RebootPending
Write-Log "SUMMARY:"
Write-Log "  Removed: $($removed.Count) -> $([string]::Join(', ', ($removed | Select-Object -Unique)))"
Write-Log "  Not found/not installed: $($notInstalled.Count) -> $([string]::Join(', ', ($notInstalled | Select-Object -Unique)))"
Write-Log "  Hidden: $($hidden.Count) -> $([string]::Join(', ', ($hidden | Select-Object -Unique)))"
if ($removeErrors.Count -gt 0) {
  Write-Log -Level WARN -Message "  Removal errors: $([string]::Join('; ', $removeErrors))"
}
if ($pending) {
  Write-Log -Level WARN -Message "A restart is required to complete removal."
} else {
  Write-Log -Level DONE -Message "Restart is not mandatory but recommended."
}

Write-Log -Level DONE -Message "Log saved to: $Log"