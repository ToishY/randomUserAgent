[CmdletBinding()]
<# 
    .SYNOPSIS 
        Retrieve a random user-agent from text file.

    .PARAMETER file 
        The literal file path of the text file containing user-agents.

    .EXAMPLE  
        .\randomUserAgent.ps1

    .EXAMPLE  
        .\randomString.ps1 -file "C:\Users\Kintoki\user_agents.txt"

    .NOTES 
        NAME:       randomUserAgent
        AUTHOR:     ToishY
        GIT:        https://github.com/ToishY/randomUserAgent
        CREATED:    05/01/2019 
        LASTEDIT:   05/01/2019
        VERSION:    1.0
#>

Param(
    [Parameter(Mandatory=$false)]
    [string]$my_agents = 'user_agents.txt'
)

function getRandomUserAgent{
    Param(
        [Parameter(Mandatory=$true)]
        [string]$ua_file
    )
    return ( Get-Content -LiteralPath $ua_file | Sort{Get-Random} | Select -First 1 )
}

# Call randomString
getRandomUserAgent -ua_file $my_agents
