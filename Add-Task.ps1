function Add-Task {
    <#
    .SYNOPSIS
        Add a scheduled task for a PowerShell script.

    .DESCRIPTION
        This function adds a new scheduled task to execute a PowerShell script.
        The task runs as System.

    .EXAMPLE
        Add-Task

    .EXAMPLE
        Add-Task -TaskName "My Script" -ScriptPath "C:\Scripts\MyScript.ps1"

    #>
    param (
        [Parameter(Mandatory)]
        [string]$TaskName,

        [Parameter(Mandatory)]
        [string]$ScriptPath
    )
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $action = New-ScheduledTaskAction -Execute "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe" -Argument "-ExecutionPolicy Bypass -File $ScriptPath"
    Register-ScheduledTask -User "System" -Action $action -TaskName $TaskName -Trigger $trigger -RunLevel Highest
}
