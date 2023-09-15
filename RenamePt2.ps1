#This script can only be executed in admin context. This must be set during Intune app configuration. 
$newHostname = Get-Content -Path C:\scripts\hostname.txt
if ($newHostname -ne "-OD" -and $newHostname -and "-OL" -and $newhostname -ne "SKIP") {
        Rename-Computer -NewName $newHostname
} else {
#This is a failsafe in case the Part 1 script fails in some way and prevents the machine from just renaming to JUST the appended characters after the Azure email. Adjust according to how you set Part 1.
    Write-Host "Hostname from the file is either '-OD' or '-OL' which are invalid. Cancelling rename operation."
}
<#Then, we generate a blank file in C:\scripts in order to detect to that file in Intune to prevent this script from running again.
We will then convert this script into an .intunewin file and set it to be dependent on the Part 1 of the script so that the first script runs first#>
New-Item c:\scripts\rnc -type file