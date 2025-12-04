Describe "Get-Timer" {

    BeforeAll {
        Import-Module $PSScriptRoot\..\Runner.psm1 -Force
    }

    It "Gets the current state of the timer" {
        Mock -CommandName Invoke-RestMethod -MockWith {throw "This is a default Mock."} -ModuleName Runner

        Mock -CommandName Invoke-RestMethod -ParameterFilter { $Uri  -like '*/getTimer*'} -MockWith {
            [PSCustomObject]@{
                i_state = 1200000 # time length in miliseconds
                l_state = "Locked" # lock state
                p_state = 0 # pause mode
            }
        } -ModuleName Runner

        $actual = Get-Timer

        $actual.Time | Should -Be 1200000
        $actual.State | Should -Be "Locked"
        $actual.Paused | Should -Be 0
    }
}