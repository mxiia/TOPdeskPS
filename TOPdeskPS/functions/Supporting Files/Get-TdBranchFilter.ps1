function Get-TdBranchFilter {
    <#
	.SYNOPSIS
		Gets branch filters
	.DESCRIPTION
        You can return either a list of all branch filters, or the branch filters for an operator if you provide their Id.
    .PARAMETER OperatorId
        Id of the operator that you want to return branch filters for.
    .PARAMETER Name
        Name filter for the branch filters that you want returned. Wildcards accepted. Default value = '*'
	.EXAMPLE
		PS C:\> Get-TdBranchFilter
        Gets a list of all branch filters.
    .EXAMPLE
        PS C:\> Get-TdOperator | Get-TdBranchFilter
      Returns branch filters for the given operators.
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdBranchFilter')]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [Alias('id')]
        $OperatorId,

        [system.string]
        $Name = '*'
    )
    process {
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
        Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug

        if ($OperatorId) {
            Write-PSFMessage "OperatorId detected sending webrequest." -Level InternalComment
            $uri = (Get-TdUrl) + "/tas/api/operators/id/$($OperatorId)/filters/branch"
            Write-PSFMessage "uri - $uri" -Level InternalComment
            Invoke-TdMethod -Uri $uri | Where-Object Name -like $Name
        }
        else {
            $Uri = (Get-TdUrl) + '/tas/api/operators/filters/branch'
            Invoke-TdMethod -Uri $uri
        }
    }
}
