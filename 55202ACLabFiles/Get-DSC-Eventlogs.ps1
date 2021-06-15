# Enable Analytic EventLogs
wevtutil.exe set-log "microsoft-windows-dsc/analytic" /quiet:true /enabled:true

# List DSC EventLogs
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Operational"
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Analytic" # Produces Error
Get-WinEvent -LogName "Microsoft-Windows-DSC/Analytic" -Oldest 

