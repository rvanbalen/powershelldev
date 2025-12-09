function ConvertFrom-TimeLengthRaw {
    param (
        [Parameter(Mandatory)]
        [int] $TimeLengthRaw
    )

    $Seconds = ($TimeLengthRaw / 1000)
    $Hours = [Math]::Truncate($Seconds / 3600)
    $Minutes = [Math]::Truncate(($Seconds % 3600) / 60)
    $Secs = ($Seconds % 60)

    return [PSCustomObject]@{
        Hours = "{0:F0}" -f $Hours
        Minutes = "{0:F0}" -f $Minutes
        Seconds = "{0:F0}" -f $Secs
        Duration = [timespan]::FromMilliseconds($TimeLengthRaw).ToString()
    }
}