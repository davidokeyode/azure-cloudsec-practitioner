
### Prepare the environment
* azpentestenvXX
```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

$url = "https://raw.githubusercontent.com/davidokeyode/azure-cloudsec-practitioner/main/pentest-scenarios/02-platform-resource-enum/platform-resource-enumeration.ps1"

Invoke-Expression (Invoke-WebRequest -Uri $url).Content
```

### Run from Pentest VM
* If you receive some error messages about AzureRm, please ignore (AzureRm is deprecated and will be removed in a future release)
```
cd "$env:SystemDrive\PentestTools\Azure\Attack\MicroBurst"
Import-Module .\MicroBurst.psm1

dir -Recurse .\MicroBurst-master | Unblock-File
```

### Authenticate to the Supporting Modules
```
Connect-AzAccount

Connect-AzureAD

Connect-MsolService
```

### Use the Invoke-EnumerateAzureSubDomains function to identify potential targets that have a base name of azurepentesting
```
Invoke-EnumerateAzureSubDomains -Base azurepentesting
```




### Cleanup the environment
* azpentestenvXX
```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

$url = "https://raw.githubusercontent.com/davidokeyode/azure-cloudsec-practitioner/main/pentest-scenarios/02-platform-resource-enum/platform-resource-enumeration-cleanup.ps1"

Invoke-Expression (Invoke-WebRequest -Uri $url).Content
```











