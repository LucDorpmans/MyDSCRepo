# Demo the script sleeping
Configuration ScriptDemoShowScript {

    Import-DscResource -ModuleName PSDesiredStateConfiguration

Node Studentserver2 {
    Script ScriptDemoShowScript {
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


ScriptDemoShowScript -OutputPath "C:\Demo\ScriptDemoShowScript"

Start-DscConfiguration -Path "C:\Demo\ScriptDemoShowScript" -Verbose -Wait
