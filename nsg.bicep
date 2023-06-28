param nsg_name string
param allow_rdp bool = false


resource nsg 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: nsg_name
  location: resourceGroup().location

}

resource networkSecurityGroupSecurityRule 'Microsoft.Network/networkSecurityGroups/securityRules@2019-11-01' = if(allow_rdp){
  name: 'RDP'
  parent:nsg
  properties: {
    description: 'description'
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '3389'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
  }
}



