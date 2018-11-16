Write-Host "Agent Name $Env:AGENT_NAME."
Write-Host "Agent ID is $Env:AGENT_ID."
Write-Host "Client $args."

$client = $args[0]
$basePath = $Env:BUILD_SOURCESDIRECTORY
$sourcePath = '\MobileApp\Dev_Current\MobileApp\src\accountAssets\'
$scriptFile = '\copyAsset.ps1'
$assetScriptPath = $basePath +$sourcePath+$client+$scriptFile
if (-not $assetScriptPath)
{
    Write-Error ("Asset Copy Powershell File is missing.")
    exit 1
}
Write-Host "Script $assetScriptPath"
Invoke-Expression "&$assetScriptPath"
Write-Host "Script Execution Completed"