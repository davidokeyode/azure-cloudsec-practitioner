## GetEntraIDInfo

This PowerShell script fetches and displays information about an Entra ID tenant based on a provided email address. It can determine whether the organization is using Entra ID, if federation is configured and provides relevant details such as the Tenant ID, Tenant Region, User State, and Federation Auth URL. This is useful for anonymous recon in an Azure Pentest scenario.

## Prerequisites
- **PowerShell**: You should have either Windows PowerShell or PowerShell Core installed.
- **Internet Access**: The script fetches data from Azure's public endpoints. Ensure you have internet access.

## Usage

1. **Launch a PowerShell terminal on your PC**

2. **Download the script**:
```
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/davidokeyode/azure-cloudsec-practitioner/main/GetEntraIDInfo/GetEntraIDInfo.ps1" -OutFile "GetEntraIDInfo.ps1"

Unblock-File -Path .\GetEntraIDInfo.ps1

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```

3. **Execute the script, providing the email as an argument:**:
* Replace **`example@domain.onmicrosoft.com`** with the email or username you want to query.
```
.\GetAzureInfo.ps1 -Email "example@domain.onmicrosoft.com"
```

4. **Output Details**
* The script provides the following output details:
   * **Entra ID Discovery**: This indicates whether the domain exists in Entra ID.
   * **Entra ID Configuration**: This provides information on how Entra ID is implemented for the domain.
   * **Entra Tenant ID**: Displays the Entra ID Tenant ID if Entra ID is in use.
   * **Entra Tenant Region**: Indicates the region of the Entra ID tenant.
   * **User State**: Provides the state of the user in the Entra ID tenant.
   * **Federation**: Indicates if Federation is configured or not.
   * **Federation Auth URL**: If Federation is configured, this URL provides the authentication endpoint for the federation service.

