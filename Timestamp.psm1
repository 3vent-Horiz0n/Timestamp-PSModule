<#
.SYNOPSIS
    Returns a Date/Time string.
.DESCRIPTION
    Returns a Date/Time string depending on the parameter given.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Get-Timestamp
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
.EXAMPLE
    Get-Timestamp -Log
    expl...
.EXAMPLE
    Get-Timestamp -File
    expl...
.OUTPUTS
    System.String
.NOTES
    github url
#>

function Get-Timestamp {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $false
        )]
        [ValidateSet(
            'File', 'Date', 'Time'
        )]
        [string]$Format
    )

    switch ($Format) {
        'Date' {
            $Timestamp = Get-Date -Format 'dd.MM.yyyy'
        }
        'File' {
            Write-Host 'File'
        }
        'File' { Write-Host 'File' }
        Default {
            Write-Verbose "No parameter given, returning default Timestamp."
            Get-Date
        }
    }
    return $Timestamp
}

Get-Timestamp -Verbose