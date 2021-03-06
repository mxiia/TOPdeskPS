﻿function Get-TdUrl {
<#
	.SYNOPSIS
		Grabs the TOPdesk url from the config system using Get-PSFConfigValue
	
	.DESCRIPTION
		Grabs the TOPdesk url from the config system using Get-PSFConfigValue
	
	.EXAMPLE
		PS C:\> Get-TdUrl
		Grabs the TOPdesk url from the config system using Get-PSFConfigValue
	
	.NOTES
		Additional information about the function.
#>
	
	[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdUrl')]
	[OutputType([System.String])]
	param ()
	
	begin {
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
	}
	process {
		try {
			Get-PSFConfigValue -FullName TOPdeskPS.Url -NotNull
		}
		catch {
			throw 'Unable to find your TOPdesk url. Try running Connect-TdService.'
		}
	}
	end {
	}
}