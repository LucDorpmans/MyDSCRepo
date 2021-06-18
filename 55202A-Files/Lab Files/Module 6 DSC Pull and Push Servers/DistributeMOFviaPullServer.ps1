$configData = @{
    AllNodes = @(
        @{
            NodeName = 'StudentServer2'                      
        }
    )    
}
Configuration SampleLog

{
Import-DscResource -ModuleName PSDesiredStateConfiguration
    node $AllNodes.Nodename
    {
        Log SampleMessage
        {
            Message = "Sample Message" 
        }
        
    }
}

SampleLog -ConfigurationData $configData -outputpath C:\Holding\Configurations\

# Create checksum for config file
New-DscChecksum -Path C:\Holding\Configurations\
Get-ChildItem 'C:\Holding\Configurations\'
 
# You must move the files to the Configuration folder before executing the next line.
Copy-Item -Path 'C:\Holding\Configurations\StudentServer2.mof' -Destination 'C:\Program Files\WindowsPowerShell\DscService\' -Force
Copy-Item -Path 'C:\Holding\Configurations\StudentServer2.mof' -Destination 'C:\Program Files\WindowsPowerShell\DscService\' -Force
Get-ChildItem 'C:\Program Files\WindowsPowerShell\DscService\'

Update-DscConfiguration -Verbose -Wait
#>