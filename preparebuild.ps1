Write-Host "Agent Name $Env:AGENT_NAME."
Write-Host "Agent ID is $Env:AGENT_ID."
Write-Host "Client $args."

$assetConfigPath = $Env:BUILD_SOURCESDIRECTORY+'\asset-config.json'
if (-not $assetConfigPath)
{
    Write-Error ("Asset Configuration File is missing.")
    exit 1
}

$client = $args
$assetConfig = Get-Content $assetConfigPath | Out-String | ConvertFrom-Json

gci $Env:AGENT_BUILDDIRECTORY
Write-Host "BUILD_SOURCESDIRECTORY contents:"
gci $Env:BUILD_SOURCESDIRECTORY
Write-Host "Script Execution Completed"