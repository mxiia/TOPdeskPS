function Set-TdBranchFilter {
    <#
	.SYNOPSIS
		Sets branch filters
	.DESCRIPTION
        You can return either a list of all branch filters, or the branch filters for an operator if you provide their Id.
    .PARAMETER OperatorId
        Id of the operator that you want to return branch filters for.
    .PARAMETER FilterId
        Id of the branch filter that you want to link to the operator. See Get-TdBranchFilter
    .EXAMPLE
        PS C:\> Get-TdOperator -topdeskloginname 'tester@test.com' | Set-TdBranchFilter -FilterId (Get-TdBranchFilter -Name ExampleBranchFilter).id
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdBranchFilter')]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [Alias('id')]
        $OperatorId,

        [System.String]$FilterId
    )
    begin {

    }
    #TODO test this further
    #Set-TdBranchFilter -FilterId (Get-TdBranchFilter).id -OperatorId (Get-TdOperator -topdeskloginname 'michael.arena@igymarinas.com').id

    process {
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
        Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug
        $uri = (Get-TdUrl) + "/tas/api/operators/id/$OperatorId/filters/branch"
        $body = [pscustomobject]@{
            id = $FilterId
        }
        Invoke-TdMethod -uri $uri -Method 'POST' -Body ($body | ConvertTo-Json)
    }
    end {

    }
}
