param name string
param location string= resourceGroup().location
var storageaccountname = '${toLower(name)}${toLower(uniqueString(resourceGroup().id))}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageaccountname
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

output storageEndPoint string = storageaccount.properties.primaryEndpoints.web

