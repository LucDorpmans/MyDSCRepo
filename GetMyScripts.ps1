# GetMyScripts.ps1
Function Get-MyScript { Param( [string]$AFile,[switch]$EditFile = $False, 
							   [string]$SPath = "$env:USERPROFILE\Downloads\")
			Invoke-Webrequest -Uri "https://raw.githubusercontent.com/LucDorpmans/MyDSCRepo/main/$AFile"  -Outfile "$SPath$AFile" 
			If ($EditFile) { PSEdit  ("$SPath$AFile" )} }
		
Get-MyScript "EdgeMSI-Download-Only-Complete.ps1"
Get-MyScript "Edge-InstallOnly.ps1"
Get-MyScript "PowerShell-Core-Download+Install.ps1"
Get-MyScript "Chrome-Download+Run-Installer.ps1" 
Get-MyScript "NuGet+PSGallery+xDSC.ps1" -EditFile
Get-MyScript "Get55202A-Files.ps1" -EditFile

