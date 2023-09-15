#This script can only be executed in user context. This can be directly configured in the properties of the win32 app in Intune.
##variables
$Email = (whoami /upn)
$modifiedEmail = $Email -replace "@.*$"
$systemType = (Get-ComputerInfo).CsPCSystemType
$hostname= hostname

#Because the default hostname length limit is only 15 digits, this takes the user's firstinitiallastname and then cuts it down to 12 characters so that the addition of -OL/-OD is exactly 15. OL/OD standing for Office Laptop/Office Desktop. Edit this to your liking. 
if ($modifiedEmail.Length -ge 12) {
    $modifiedEmail = $modifiedEmail.Substring(0, 12)
}

if ($systemType -eq "Desktop" -or $systemType -eq "Workstation") {
    $modifiedEmail = ($modifiedEmail + "-OD").ToUpper()
} else {
    $modifiedEmail = ($modifiedEmail + "-OL").ToUpper()
	}
	
# Check if the 'scripts' folder exists, create it if it doesn't. Detect this item via the scripts file located in C:\scripts in Intune. 
$folderPath = "C:\scripts"
if (-Not (Test-Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

Set-Content -Path $folderpath\hostname.txt -Value $modifiedEmail