# Enable Analytic EventLogs

# Command line
wevtutil.exe set-log "microsoft-windows-dsc/analytic" /quiet:true /enabled:true

#PowerShell:
Install-PackageProvider nuget -Force 
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module xDscDiagnostics -Verbose -Repository PSGallery
Invoke-Command -ComputerName StudentServer1 { Update-xDcsEventLogStatus -Channel Analytic -Status Enabled }
Invoke-Command -ComputerName StudentServer1 { Update-xDcsEventLogStatus -Channel debug -Status Enabled }

# List DSC EventLogs
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Operational"
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Analytic" # Produces Error
Get-WinEvent -LogName "Microsoft-Windows-DSC/Analytic" -Oldest -MaxEvents 15

