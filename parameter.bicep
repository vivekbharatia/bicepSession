param storagename string 
param reslocation string = 'centralindia'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storagename
  location: reslocation
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}


