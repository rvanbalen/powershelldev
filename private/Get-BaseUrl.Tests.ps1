Describe "Get-BaseUrl" {

    BeforeAll {
        . $PSCommandPath.Replace('.Tests.ps1','.ps1')
    }

    It 'Should return a BaseUrl' {
        Get-BaseUrl | Should -Be "http://localhost:3000"
    }
}