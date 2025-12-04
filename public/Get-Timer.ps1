function Get-Timer {

    $url = Get-Url -Endpoint "getTimer"

    $response = Invoke-RestMethod -Uri $url -Method GET

    return [PSCustomObject]@{
        TimeLengthRaw = $response.Split(';')[0]
        TimerState = $response.Split(';')[1]
        PauseMode = $response.Split(';')[2]
    }
}