Get-WinEvent -LogName "Microsoft-Windows-Dsc/Operational"
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Analytic"
Get-WinEvent -LogName "Microsoft-Windows-DSC/Analytic" -Oldest 

wevtutil.exe set-log "microsoft-windows-dsc/analytic" /quiet:true /enabled:true