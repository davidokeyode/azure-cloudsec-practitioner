## GetEntraIDInfo

This PowerShell script fetches and displays information about an Entra ID tenant based on a provided email address. It can determine whether the organization is using Entra ID, if federation is configured and provides relevant details such as the Tenant ID, Tenant Region, User State, and Federation Auth URL. This is useful for anonymous recon in an Azure Pentest scenario.

## Prerequisites
- **PowerShell**: You should have either Windows PowerShell or PowerShell Core installed.
- **Internet Access**: The script fetches data from Azure's public endpoints. Ensure you have internet access.

## Usage

1. **Launch a PowerShell terminal on your PC**

2. **Download the script**:
   ```powershell
   Save the provided script to a `.ps1` file, for example, `GetAzureInfo.ps1`.

3. **Open PowerShell**:

```
.\GetAzureInfo.ps1 -Email "example@domain.onmicrosoft.com"
```

