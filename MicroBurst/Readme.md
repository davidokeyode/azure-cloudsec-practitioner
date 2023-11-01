
### Prepare the environment
```
Invoke-WebRequest -Uri
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
















