param existVnetName string
param name string
param addressPrefix string
param delegations array = []

resource existVnet 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  scope: resourceGroup()
  name: existVnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-02-01' = {
  parent: existVnet
  name: name
  properties: {
    addressPrefix: addressPrefix
    delegations: delegations
  }
}

output id string = subnet.id
output name string = subnet.name
