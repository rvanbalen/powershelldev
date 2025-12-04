Describe "Get-Timer" {

    BeforeAll {
        Import-Module $PSScriptRoot\..\Runner.psm1 -Force
    }

    It "Gets the current state of the timer" {
        Mock -CommandName Invoke-RestMethod -MockWith {throw "This is a default Mock."} -ModuleName Runner

        Mock -CommandName Invoke-RestMethod -ParameterFilter { $Uri  -like '*getTimer*'} -MockWith {
            "300000;closed;0"
        } -ModuleName Runner

        $actual = Get-Timer

        $actual.TimeLengthRaw | Should -Be "300000"
        $actual.TimerState | Should -Be "closed"
        $actual.PauseMode | Should -Be 0
    }
}