function Remove-TdBranchFilter {
    <#
	.SYNOPSIS
		removes branch filters
	.DESCRIPTION
        Removes the link between a branch filter and an operator
    .PARAMETER OperatorId
        Id of the operator that you want to remove the branch filters from.
    .PARAMETER FilterId
        Id of the branch filter that you want to remove from the operator. See Get-TdBranchFilter
    .EXAMPLE
        PS C:\> Get-TdOperator -topdeskloginname 'tester@test.com' | Remove-TdBranchFilter -FilterId (Get-TdBranchFilter -Name ExampleBranchFilter).id
        Removes branch filter 'examplebranchfilter' from the operator 'tester@test.com'
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Remove-TdBranchFilter')]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [Alias('id')]
        $OperatorId,

        [System.String]$FilterId
    )
    begin {

    }
    #TODO test this further and verify before proceeding
    #Set-TdBranchFilter -FilterId (Get-TdBranchFilter).id -OperatorId (Get-TdOperator -topdeskloginname 'michael.arena@igymarinas.com').id

    process {
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
        Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug
        $uri = (Get-TdUrl) + "/tas/api/operators/id/$OperatorId/filters/branch"
        $body = [pscustomobject]@{
            id = $FilterId
        }
        Invoke-TdMethod -uri $uri -Method 'DELETE' -Body ($body | ConvertTo-Json)
    }
    end {

    }
}
