function Create-FunctionApp {
    param (
        # Parameter help description
        [Parameter(Mandatory)]
        [string]$RGName,
        # Parameter help description
        [Parameter(Mandatory)]
        [string]$name,
        # Parameter help description
        [Parameter(Mandatory)]
        [string]$storageAccountName
    )
    
    az storage account create --name $storageAccountName `
                              --resource-group $RGName
    
    $plan = az functionapp plan create -g $RGName `
                                    -n $( $name + 'plan') `
                                    --min-instances 1 `
                                    --max-burst 5 `
                                    --sku EP1
    $plan

    az functionapp create -g $RGName `
                          -n $name `
                          --plan $( $name + 'plan') `
                          --runtime powershell `
                          --storage-account $storageAccountName `
                          --functions-version 2

}