Write-Host "Agent Name $Env:AGENT_NAME."
Write-Host "Agent ID is $Env:AGENT_ID."
Write-Host "Client $args[0]."

if (-not $Env:BUILD_SOURCESDIRECTORY/asset-config.json)
{
    Write-Error ("Asset Configuration File is missing.")
    exit 1
}

$client = $args[0]
$assetConfig = Get-Content '$Env:BUILD_SOURCESDIRECTORY/asset-config.json' | Out-String | ConvertFrom-Json

gci $Env:AGENT_BUILDDIRECTORY
Write-Host "BUILD_SOURCESDIRECTORY contents:"
gci $Env:BUILD_SOURCESDIRECTORY
Write-Host "Script Execution Completed"