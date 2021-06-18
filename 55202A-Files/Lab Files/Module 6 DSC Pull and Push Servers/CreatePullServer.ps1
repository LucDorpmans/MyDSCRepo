# DSC configuration for Pull Server
# Prerequisite: Certificate "CN=PSDSCPullServerCert" in "CERT:\LocalMachine\MY\" store for SSL
# Prerequisite: $RegistrationKey value generated using ([guid]::NewGuid()).Guid
# Note: A Certificate may be generated using MakeCert.exe: http://msdn.microsoft.com/en-us/library/windows/desktop/aa386968%28v=vs.85%29.aspx

configuration Sample_xDscWebService 
{ 
    param  
    ( 
            [string[]]$NodeName = 'localhost', 

            [Parameter(HelpMessage='Use AllowUnencryptedTraffic for setting up a non SSL based endpoint (Recommended only for test purpose)')]
            [ValidateNotNullOrEmpty()] 
            [string] $certificateThumbPrint,

            [Parameter(HelpMessage='This should be a string with enough entropy (randomness) to protect the registration of clients to the pull server.  We will use new GUID by default.')]
            [ValidateNotNullOrEmpty()]
            [string] $RegistrationKey = ([guid]::NewGuid()).Guid
     ) 


     Import-DSCResource -ModuleName xPSDesiredStateConfiguration -ModuleVersion 3.13.0.0
     Import-DSCResource -ModuleName PSDesiredStateConfiguration 

     Node $NodeName 
     { 
         WindowsFeature DSCServiceFeature 
         { 
             Ensure = "Present" 
             Name   = "DSC-Service"             
         } 


         xDscWebService PSDSCPullServer 
         { 
             Ensure                  = "Present" 
             EndpointName            = "PSDSCPullServer" 
             Port                    = 8086 
             PhysicalPath            = "$env:SystemDrive\inetpub\PSDSCPullServer" 
             CertificateThumbPrint   = "AllowUnencryptedTraffic"          
             ModulePath              = "$env:PROGRAMFILES\WindowsPowerShell\DscService\Modules" 
             ConfigurationPath       = "$env:PROGRAMFILES\WindowsPowerShell\DscService\Configuration"             
             State                   = "Started" 
             DependsOn               = "[WindowsFeature]DSCServiceFeature"                         
         } 

        File RegistrationKeyFile
        {
            Ensure          ='Present'
            Type            = 'File'
            DestinationPath = "$env:ProgramFiles\WindowsPowerShell\DscService\RegistrationKeys.txt"
            Contents        = $RegistrationKey
        }
    }
}

Sample_xDscWebService -certificateThumbPrint "AllowUnencryptedTraffic" -OutputPath C:\Demo\NoCert
Start-DscConfiguration -Path C:\Demo\NoCert -Wait -Verbose -Force

<#
Get-Website # Check the portnumber of the Pullserver site
	
# Navigate to the below-listed service. 
Start-process  http://localhost:8086/PSDSCPullServer.svc

# Append /$metadata to the URL: ! Be aware this IS case sensitive!
Start-process 'http://localhost:8086/PSDSCPullServer.svc/$metadata'


$o = Invoke-RestMethod -Uri 'http://localhost:8086/PSDSCPullServer.svc/$metadata'
$o
$o.Edmx
$o.Edmx.DataServices
$o.Edmx.DataServices.Schema
$o.Edmx.DataServices.Schema[0].EntityType


Start-Process Explorer.exe  "C:\Program Files\WindowsPowerShell\DscService"

Start-Process Explorer.exe 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\PSDesiredStateConfiguration\PullServer'



#>