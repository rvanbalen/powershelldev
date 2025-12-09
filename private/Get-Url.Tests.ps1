BeforeAll {
    Import-Module $PSScriptRoot\..\Runner.psm1 -Force
}

Describe "Get-Url" {

    It 'Should return a complete Url with routing endpoint' {
        InModuleScope Runner {
            $endPoint = "getTimer"
            Mock Get-BaseUrl {}

            Get-Url -Endpoint $endPoint

            Should -Invoke Get-BaseUrl
        }
    }
}