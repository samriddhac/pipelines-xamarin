Write-Host "Agent Name $Env:AGENT_NAME."
Write-Host "Agent ID is $Env:AGENT_ID."
Write-Host "Client $args."

function HasProperty($object, $propertyName)
{
    $propertyName -in $object.PSobject.Properties.Name
}

$assetConfigPath = $Env:BUILD_SOURCESDIRECTORY+'\asset-config.json'
if (-not $assetConfigPath)
{
    Write-Error ("Asset Configuration File is missing.")
    exit 1
}

$client = $args
$assetConfig = Get-Content $assetConfigPath | Out-String | ConvertFrom-Json
$assetProperty = 'assets'
$exclusionProperty = 'excludes'
$assetDir = $Env:BUILD_SOURCESDIRECTORY+'\*Android\Assets\'

Write-Error ("$assetConfig")
Write-Error ("$assetDir")
Write-Error ("HasProperty($assetConfig, $client)")

if (HasProperty($assetConfig, $client))
{
	$clientProperty = $assetConfig.$client
	if(HasProperty($clientProperty, $assetProperty)) 
	{
		$clientAssetProperty = $clientProperty.$assetProperty
		if(HasProperty($clientAssetProperty, $exclusionProperty))
		{
			$exclusionFiles = $clientAssetProperty.$exclusionProperty
			Write-Host "Excluded Files $exclusionFiles."
		}
	}
}
Write-Host "Script Execution Completed"