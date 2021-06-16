#[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Install-PackageProvider nuget -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Find-Module xDSC*
# Install-Module xPSDesiredStateConfiguration -Verbose -Repository PSGallery
Install-Module xDscDiagnostics -Verbose -Repository PSGallery

# Get-DscResource
