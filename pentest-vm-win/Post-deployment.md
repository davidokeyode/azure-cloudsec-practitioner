
### Add "pentestadmin" user to docker-users group and restart PC
* **`Right click the start button`** → **`PowerShell Admin`**
```
# Add user to docker-users group
Add-LocalGroupMember -Group "docker-users" -Member "pentestadmin"

# Restart PC
Restart-Computer
```

### Run the following command in PowerShell as Administrator
* **`Right click the start button`** → **`PowerShell Admin`**
```
# Update Windows Subsystem for Linux
wsl --update

# Start Docker and Accept License Agreement
$dockerPath = "$env:ProgramFiles\Docker\Docker\Docker Desktop.exe"
Start-Process -FilePath $dockerPath -ArgumentList "-AcceptLicense"
```
* **`Accept license`** → **`Continue without signing in`** → **`Skip`**
* Wait for Docker to start before proceeding

### Run the scripts to start BloodHound
* **`Right click the start button`** → **`PowerShell Admin`**
```
. $env:SystemDrive\PentestTools\Azure\Attack\BloodHound\install-bloodhound.ps1
```

### Configure BloodHound
* Leave the previous PowerShell console open and Open another **`PowerShell Admin`** console
* Obtain the password for the neo4j user
```
$bloodhoundlogs = docker logs pentestadmin-bloodhound-1 2>&1
$bloodhoundlogs | Where-Object { $_ -like "*Initial Password Set To*" }
```
* Open the BloodHound GUI
```
start msedge http://localhost:8080
```
* Authenticate with the following credentials
```
username: admin
password: THE_PASSWORD_FROM_THE_PREVIOUS_STEP
```
* Set and confirm a new complex password

### Run the script to start StormSpotter
* **`Right click the start button`** → **`PowerShell Admin`**
```
. $env:SystemDrive\PentestTools\Azure\Attack\StormSpotter\install-stormspotter.ps1
```