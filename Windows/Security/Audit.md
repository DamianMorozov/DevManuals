# Audit

## Log files
Windows Event Logs:	`%SystemRoot%\System32\winevt\Logs`
System logs:		`%SystemRoot%\System32\winevt\Logs\System.evtx`
Application logs:	`%SystemRoot%\System32\winevt\Logs\Application.evtx`
the Security logs:	`%SystemRoot%\System32\winevt\Logs\Security.evtx`

## How disable Audit for `The Windows Filtering Platform has blocked a packet`?
Run `gpedit.msc`.
`Computer Configuration` -> `Windows Settings` -> `Security Settings` -> `Advanced Audit Policy Configuration` -> `System Audit Policies` -> `Detailed Tracking`.
Edit the properties `Audit PNP Activity`: `Configure the following audit events` -> uncheck the boxes.
Click `OK` to save the changes.
