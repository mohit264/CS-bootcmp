function New-ResourceGroup {
    [cmdletbinding(SupportsShouldProcess)]

    param (
        # Parameter help description
        [Parameter(Mandatory)]
        [string]
        $rgName,

        # Parameter help description
        [Parameter(Mandatory)]
        [string]
        $location
    )
    $params = @{
        'Name' = $rgName
        'Location' = $location
    }
    if ($pscmdlet.ShouldProcess('location')) {
        New-AzResourceGroup @params
    }
}