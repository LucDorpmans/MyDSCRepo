# Demo Script JobName Parameter
Configuration ScriptDemoJobNameParameter {

    Import-DscResource -ModuleName PSDesiredStateConfiguration

Node ("StudentserverX", "StudentServer2")  {
    Script ScriptDemoJobNameParameter {
        GetScript = {
            @{
                GetScript = $GetScript
                SetScript = $SetScript
                TestScript = $TestScript
                Result = "TestScript"
                }
           }
        SetScript = {
            Write-Verbose "Sleeping for 15 seconds"
            Start-Sleep 15
            Write-Verbose "Script Task Complete"
            }
        TestScript = { 
            $false 
            }
        }
    }
}


ScriptDemoJobNameParameter -OutputPath "C:\Demo\ScriptDemoJobNameParameter"

$ConfigJob = Start-DscConfiguration -Path "C:\Demo\ScriptDemoJobNameParameter" -Verbose -Force -JobName ScriptDemoShowScript


# Get-job -Name Job40 | Select Debug, Error, Output, Verbose, Warning
