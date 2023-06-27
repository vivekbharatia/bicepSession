param newAppParam string
param moduleEnvironmentType string
param location string = resourceGroup().location

module myAppModule 'variable.bicep' ={
  name:'moduleAppService'
  params:{
    appName:newAppParam
    environmentType:moduleEnvironmentType
    location:location
  }
}

module myAppStorageAccount 'strorageaccount.bicep'={
  name:'myAppStorageAccount'
  params:{
    name:newAppParam
    location:location
  }
}

output appServiceAppHostName string= myAppModule.outputs.defaulthost
output saEndPoint string = myAppStorageAccount.outputs.storageEndPoint
