


### Documentation
* https://github.com/dirkjanm/ROADtools/wiki/ROADtools-Token-eXchange-(roadtx)

### Functions
* Register and join devices to Azure AD.
* Request Primary Refresh Tokens from user credentials or other valid tokens.
* Use Primary Refresh Tokens in a similar way as the Web Account Manager (WAM) in Windows does.
* Perform all kind of Oauth2 token redemption flows.
* Perform interactive logins based on Browser SSO by injecting the Primary Refresh Token into the authentication flow.
* Add SSO capabilities to Chrome via the Windows 10 accounts plugin and a custom browsercore implementation.
* Automate sign-ins, MFA and token requesting to various resources in Azure AD by using Selenium.
* Possibility to load credentials and MFA TOTP seeds from a KeePass database to use in automated flows.


### Pre-Requisites
* Python 3.7 or newer
* Pip
* OpenSSL
```
python --version
python3 --version
pip --version

choco upgrade python -y
choco install openssl -y
python -m pip install --upgrade pip setuptools
pip install packaging
pip install setuptools
```

### Installation (Using Pip)
```
pip install roadtx
```

### Installation (From GitHub)
```
git clone https://github.com/dirkjanm/roadtools.git "$env:SystemDrive\PentestTools\Azure\Attack\ROADTools"

cd "$env:SystemDrive\PentestTools\Azure\Attack\ROADTools"

pip install roadlib/

pip install roadtx/
```

### Usage
```
roadtx -h

roadtx listaliases

roadtx gettokens -u <username> -p <password> -c azcli -r azrm

notepad .roadtools_auth
- review accessToken; refreshToken; _clientId
```

### Use the refresh token to obtain access token for Azure Resource Manager
```
roadtx gettokens -u <username> -p <password> -c azcli -r aadgraph

roadtx gettokens -u <username> -p <password> -c azcli -r azrm

Get-Content .roadtools_auth | roadtx describe | jq .
- review app_displayname, audience (aud) and scope (scp)
"_clientId": "04b07795-8ddb-461a-bbee-02f9e1bf7b46"
```

roadtx gettokens --refresh-token file -c azcli -r msgraph


roadtx gettokens --refresh-token file -c msteams



Use the Azure CLI client ID and request access to Azure Resource manager (the resulting refresh token can be used with AzureHound).
roadtx prtauth -c azcli -r azrm    


Use the Microsoft Teams client ID, request tokens for Microsoft Graph
roadtx prtauth -c msteams -r msgraph



```



























