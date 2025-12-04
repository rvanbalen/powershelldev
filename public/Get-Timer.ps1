function Get-Timer {

    $url = Get-Url -Endpoint "getTimer"

    $timer = Invoke-RestMethod $Uri $url -Method GET

    return @{
        Time = $timer.i_state
        State = $timer.l_state
        Paused = $timer.p_state
    }
}