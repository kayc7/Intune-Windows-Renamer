# Intune Windows Renamer
**The scripts contained in this repo can be finetuned to your liking. Since both parts are linked, make sure you are making necessary changes on both parts.**

### Basic tips for proper deployment
* Make sure to make Part 2 of the script dependent on Part 1.
* Part 1 MUST be run in user-context. This can be set during the 'Program' section in Win32 app setup. Select 'User' for Install behavior.
* Part 2 MUST be run in system-context. This is the default option when creating a Win32 app.
* The install commmand requires 64-bit Powershell. It is best practice to use this anyways, as it has many newer cmdlets available compared to the 32 bit host. The command is as follows: <br>
```%WINDIR%\sysnative\WindowsPowerShell\v1.0\powershell.exe -noprofile -executionpolicy bypass -windowstyle hidden -file .\FILENAME.ps1```<br>
Remember to rename FILENAME in the command above to the name you assign to the script.
* The uninstall command should always be based on the file you generated from a PS script to detect via Intune. In the case of Part 1's script, it would be <br>
```cmd.exe /c del C:\scripts\hostname.txt```
* For Part 1, detect via 'Manually configure detection rules' and set it to C:\scripts with the file 'hostname.txt'
* For Part 2, detect in the same way as Part 1 but with the file 'rnc'
