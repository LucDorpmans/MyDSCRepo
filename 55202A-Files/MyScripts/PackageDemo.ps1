# PackageDemo
$PuttyMSI = "putty-64bit-0.75-installer.msi"
# Invoke-Webrequest -Uri "https://the.earth.li/~sgtatham/putty/latest/w64/$PuttyMSI"    -Outfile "C:\Temp\$PuttyMSI"
# Get-AppLockerFileInformation -Path "C:\Temp\$PuttyMSI" | select -ExpandProperty Publisher # | Select BinaryName

Configuration PackageDemo
{
    Package PackageExample
    {
        Ensure      = "Present"  # You can also set Ensure to "Absent"
        Path        = $PuttyMSI # "C:\Temp\PuTTY 0.75 (x64).msi"
        Name        = "PUTTY RELEASE 0.75 (64-BIT)"
        ProductId   = "{06DB09EC-52D5-47FA-A0F3-D70ED6407481}"
    }
}


PackageDemo -OutputPath 'C:\DSC Resources\MOF\PackageDemo\'

Start-DscConfiguration -Path 'C:\DSC Resources\MOF\PackageDemo\' -Wait -Verbose -Force

