resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'vivek123456789'
  location: 'centralindia'
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}



