Write-Host "Agent Name $Env:AGENT_NAME."
Write-Host "Agent ID is $Env:AGENT_ID."

#$accountId = $args[0]
#$accountSecret = $args[1]

$accountId = 'a'
$accountSecret = 'ab'
$basePath = 'C:\MobileApp\Dev_Current\MobileApp'

#$basePath = $Env:BUILD_SOURCESDIRECTORY
$sourcePath = '\src\'
$configFile = '\config.json'
$configPath = $basePath +$sourcePath+$configFile

$appConfig = 'AppConfig'

if (-not $configPath)
{
    Write-Error ("config.json File is missing.")
    exit 1
}
$configObject = Get-Content $configPath | ConvertFrom-Json

$configObject.$appConfig.AccountId = $accountId
$configObject.$appConfig.AccountSecret = $accountSecret

$configObject | ConvertTo-Json | set-content $configPath


Write-Host "Script Execution Completed"