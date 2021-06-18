# Silently install xPSDesiredStateConfiguration
Install-PackageProvider nuget -Force 
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module xPSDesiredStateConfiguration -Verbose -Repository PSGallery
# Install-Module xDscDiagnostics -Verbose -Repository PSGallery
# Get-DscResource

