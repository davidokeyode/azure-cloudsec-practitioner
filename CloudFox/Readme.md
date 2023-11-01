

### Run from Pentest VM
```
cd "$env:SystemDrive\PentestTools\Azure\Attack\cloudfox"
go build .
```

### Manual installation (not needed if running from Pentest VM)
```
## Pre-requisite
choco install golang -y
go version

## Download and install
git clone https://github.com/BishopFox/cloudfox.git
cd ./cloudfox
go build .
./cloudfox
```

### Help
```
./cloudfox azure -h
./cloudfox azure [command_name] -h
```

## Whoami
```
./cloudfox azure whoami
```

## Compute Enumeration
```
./cloudfox azure instances --tenant 11111111-1111-1111-1111-11111111
./cloudfox azure instances --subscription AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAA
```

## RBAC
```
./cloudfox azure rbac --subscription AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAA
./cloudfox azure rbac --tenant 11111111-1111-1111-1111-11111111
```

## Storage
```
./cloudfox az storage --tenant 11111111-1111-1111-1111-11111111
./cloudfox az storage --subscription BBBBBBBB-BBBB-BBBB-BBBB-BBBBBBBB
```
