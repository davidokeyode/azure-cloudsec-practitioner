param(
    [Parameter(Mandatory=$true)]
    [string]$Email
)

function Write-Emphasized {
    param (
        [string]$Text,
        [string]$Value
    )
    Write-Host $Text -NoNewline -ForegroundColor Green
    Write-Host " $Value"
}

# Define the URLs
$url1 = "https://login.microsoftonline.com/getuserrealm.srf?login=$Email&xml=1"
$url2Template = "https://login.microsoftonline.com/{0}/v2.0/.well-known/openid-configuration"

# Fetch the XML data from the first URL
$xmlData = Invoke-RestMethod -Uri $url1

# Extract the domain name from the XML data
$domainName = $xmlData.RealmInfo.DomainName

# Fetch the JSON data from the second URL using the domain name
$url2 = $url2Template -f $domainName
$jsonData = Invoke-RestMethod -Uri $url2

# Extract the Tenant ID directly from the issuer URL
$tenantId = ($jsonData.issuer -split "/")[-2]

# Determine Federation status and Auth URL
$federationStatus = if ($xmlData.RealmInfo.IsFederatedNS -eq "true") { "Configured" } else { "NotConfigured" }
$federationAuthURL = if ($federationStatus -eq "Configured") { $xmlData.RealmInfo.AuthURL } else { $null }

# Output the desired information
Write-Emphasized "Entra ID Usage:" $($xmlData.RealmInfo.NameSpaceType)
Write-Emphasized "Entra Tenant ID:" $tenantId
Write-Emphasized "Entra Tenant Region:" $($jsonData.tenant_region_scope)
Write-Emphasized "User State:" $($xmlData.RealmInfo.UserState)
Write-Emphasized "Federation:" $federationStatus

if ($federationAuthURL) {
    Write-Emphasized "Federation Auth URL:" $federationAuthURL
}
