[CmdletBinding()]
param (
    $name = 'csaks21',
    $rgName = 'cs-bootcmp',
    $nodeCount = 1,
    $kubernetesVersion = '1.20.5'      
    )
    
az aks create --generate-ssh-keys `
              --name $name `
              --resource-group $rgName `
              --node-count $nodeCount `
              --kubernetes-version $kubernetesVersion

#az aks get-credentials --name csaks21 --resource-group cs-bootcmp