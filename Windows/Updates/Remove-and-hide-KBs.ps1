$HideList = @("KB5001330","KB5000842","KB5025885","KB5012643", "KB5013943","KB5014019","KB5027231","KB5063878")
Write-Host "=== Remove updates ==="

foreach ($kb in $HideList) {
    $kbNumber = $kb.TrimStart('K','B')
    Write-Host "-> Uninstalling $kb ..." -NoNewline

    # wusa
    $proc = Start-Process -FilePath wusa.exe -ArgumentList "/uninstall","/kb:$kbNumber","/quiet","/norestart" -PassThru -Wait

    switch ($proc.ExitCode) {
      0     { Write-Host " OK" }
      3010  { Write-Host " Removed (reboot required)" }
      2359302 { Write-Host " Not applicable / not found" }
      default { Write-Host " Failed (ExitCode $($proc.ExitCode))" }
    }
}

Write-Host ""
Write-Host "=== Hide updates ==="

# COM-session for Windows Update
$session  = New-Object -ComObject Microsoft.Update.Session
$searcher = $session.CreateUpdateSearcher()
$result   = $searcher.Search("IsInstalled=0 and Type='Software'")
foreach ($update in $result.Updates) {
    foreach ($kb in $HideList) {
        if ($update.Title -match $kb) {
            $update.IsHidden = $true
            Write-Host "-> Hidden: $($update.Title)"
		}
    }
}

Write-Host ""
Write-Host "Success."