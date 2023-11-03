$group = "OMIGOD-RG"
$location = "eastus"
$workspace = "$location-workspace"

# Store your pentest VM public IP address in a variable
$response = Invoke-RestMethod -Uri 'http://ipinfo.io/ip'
$publicIP = $response.Trim()

# Create a resource group and workspace
az group create --name $group --location $location
az monitor log-analytics workspace create --resource-group $group --workspace-name $workspace

$workspaceid = $(az monitor log-analytics workspace show --resource-group $group --workspace-name $workspace --query id --output tsv)

$workspacekey = $(az monitor log-analytics workspace get-shared-keys --resource-group "$group" --workspace-name "$workspace" --query primarySharedKey --output tsv)

# Deploy a Linux VM with OMIGod vulnerability
az deployment group create --name "omigod-vm-deployment" --resource-group "$group" --template-uri "https://raw.githubusercontent.com/OTRF/Microsoft-Sentinel2Go/master/grocery-list/Linux/demos/CVE-2021-38647-OMI/azuredeploy.json" --parameters workspaceId="$workspaceid" workspaceKey="$workspacekey" adminUsername="azureadmin" authenticationType="password" adminPasswordOrKey="awrZzD9DJmKKXsJa" allowedIPAddresses="$publicIP"