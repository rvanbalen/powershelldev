function Get-Url {
    param (
        [Parameter(Mandatory)]
        [string] $Endpoint
    )

    $baseUrl = Get-BaseUrl

    return "$baseUrl/${Endpoint}"
}