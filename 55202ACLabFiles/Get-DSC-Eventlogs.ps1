# Enable Analytic EventLogs

# Command line
wevtutil.exe set-log "microsoft-windows-dsc/analytic" /quiet:true /enabled:true

#PowerShell:
# Enable-PSTrace [-Force] [-AnalyticOnly] [<CommonParameters>]
Enable-PSTrace -Force

# List DSC EventLogs
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Operational"
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Analytic" # Produces Error
Get-WinEvent -LogName "Microsoft-Windows-DSC/Analytic" -Oldest -MaxEvents 15

