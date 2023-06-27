@allowed([
  'nonprod'
  'prod'
])
param environmentType string

param location string= resourceGroup().location
param appName string
var appServicePlanName = '${appName}ServicePlan'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2V3' : 'F1'


resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
    capacity: 1
  }
}
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: appName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

output defaulthost string = webApplication.properties.defaultHostName


