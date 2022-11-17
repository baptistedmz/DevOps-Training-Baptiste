param storageAccountName string
param deploymentLocation string
param storageAccountSKU string 
param storageAccountKind string 
param dataFactoryName string 
param deployDataFactory bool = false


module storageAccount '../templates/storage-account.bicep' = {
  name: 'StorageAccount'
  params: {
    deploymentLocation: deploymentLocation
    storageAccountKind: storageAccountKind
    storageAccountName: storageAccountName
    storageAccountSKU: storageAccountSKU
  }
}

module dataFactory '../templates/data-factory.bicep' = if(deployDataFactory) {
  name: 'dataFactory'
  params: {
    dataFactoryName: dataFactoryName
    deploymentLocation: deploymentLocation
  }
  dependsOn: [
    storageAccount
  ]

}
