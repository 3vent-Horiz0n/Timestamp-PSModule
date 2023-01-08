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
    https://github.com/3vent-Horiz0n/Timestamp-PSModule
#>

function Get-Timestamp {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $false
        )]
        [ValidateSet(
            'Date', 'DateTime', 'File', 'Time'
        )]
        [string]$Format
    )

    switch ($Format) {
        'Date' {
            Write-Verbose "Parameter 'Date' given, returning timestamp with Date-String."
            $Timestamp = Get-Date -Format 'dd.MM.yyyy'
        }
        'DateTime' {
            Write-Verbose "Parameter 'DateTime' given, returning timestamp with Date-String and Time-String."
            $Timestamp = Get-Date -Format 'dd.MM.yyyy HH:mm:ss'
        }
        'File' {
            Write-Verbose "Parameter 'File' given, returning timestamp with File-String."
            $Timestamp = Get-Date -Format 'yyyy-MM-dd_HH-mm-ss-fff'
        }
        'Time' {
            Write-Verbose "Parameter 'Time' given, returning timestamp with Time-String."
            $Timestamp = Get-Date -Format 'HH:mm:ss'
        }
        Default {
            Write-Verbose "No parameter given, returning default Timestamp."
            $Timestamp = Get-Date
        }
    }
    return $Timestamp
}

Get-Timestamp -Verbose