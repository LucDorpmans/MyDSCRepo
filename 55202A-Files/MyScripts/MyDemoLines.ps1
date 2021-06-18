# MyDemo Lines:


#[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Install-PackageProvider nuget -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module xPSDesiredStateConfiguration -Verbose -Repository PSGallery
# Get-DscResource


# Module 5:

# Command line
wevtutil.exe set-log "microsoft-windows-dsc/analytic" /quiet:true /enabled:true

#PowerShell:
# Install-PackageProvider nuget -Force 
# Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
# Install-Module xDscDiagnostics -Verbose -Repository PSGallery
Invoke-Command -ComputerName StudentServer2 { Update-xDscEventLogStatus -Channel Analytic -Status Enabled }
Invoke-Command -ComputerName StudentServer2 { Update-xDscEventLogStatus -Channel debug -Status Enabled }


# List DSC EventLogs
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Operational" -MaxEvents 10
Get-WinEvent -LogName "Microsoft-Windows-Dsc/Analytic" # Produces Error
Get-WinEvent -LogName "Microsoft-Windows-DSC/Analytic" -Oldest -MaxEvents 10



<#
Get-Item HKLM:\\SOFTWARE\BlueBuffaloPress
Get-ItemProperty HKLM:\\SOFTWARE\BlueBuffaloPress
Get-ItemPropertyValue HKLM:\\SOFTWARE\BlueBuffaloPress -Name JustADemo
#>


# Module 6:

Get-Website # Check the portnumber of the Pullserver site
	
# Navigate to the below-listed service. 
Start-process  http://localhost:8081/PSDSCPullServer.svc

# Append /$metadata to the URL: ! Be aware this IS case sensitive!
Start-process http://localhost:8081/PSDSCPullServer.svc/$metadata


$o = Invoke-RestMethod -Uri 'http://localhost:8081/PSDSCPullServer.svc/$metadata'
$o
$o.Edmx
$o.Edmx.DataServices
$o.Edmx.DataServices.Schema
$o.Edmx.DataServices.Schema[0].EntityType


Start-Process Explorer.exe  "C:\Program Files\WindowsPowerShell\DscService"

Start-Process Explorer.exe 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\PSDesiredStateConfiguration\PullServer'


SampleLog -ConfigurationData $configData -outputpath C:\Holding\Configuration\ 
New-DscChecksum -Path C:\Holding\Configuration\
# You must move the files to the Configuration folder before executing the next line.

Copy-Item -Path 'C:\Holding\Configuration\' -Destination 'C:\Program Files\WindowsPowerShell\DscService\' -Recurse -Force
Update-DscConfiguration -Verbose -Wait


