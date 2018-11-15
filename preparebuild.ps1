Write-Host "Agent Name $Env:AGENT_NAME."
Write-Host "Agent ID is $Env:AGENT_ID."
Write-Host "Client $args."

$assetConfigPath = $Env:BUILD_SOURCESDIRECTORY+'\asset-config.json'
if (-not $assetConfigPath)
{
    Write-Error ("Asset Configuration File is missing.")
    exit 1
}

$client = $args[0]
Write-Host "Client $args."
Write-Host "Client $client."
$assetConfig = Get-Content $assetConfigPath | Out-String | ConvertFrom-Json
$assetProperty = 'assets'
$exclusionProperty = 'excludes'
$assetDir = $Env:BUILD_SOURCESDIRECTORY+'\*Android\Assets\'

if ($client -in $assetConfig.PSobject.Properties.Name)
{
	Write-Host "reached here"
	$clientProperty = $assetConfig.$client
	if($assetProperty -in $clientProperty.PSobject.Properties.Name) 
	{
		$clientAssetProperty = $clientProperty.$assetProperty
		if($exclusionProperty -in $clientAssetProperty.PSobject.Properties.Name)
		{
			$exclusionFiles = $clientAssetProperty.$exclusionProperty
			Write-Host "Excluded Files $exclusionFiles."
			foreach ($element in $exclusionFiles) {
				$filePath = $assetDir+$element
                Write-Host "Deleting File $filePath"
				Remove-Item -path $filePath
			}
		}
	}
}
Write-Host "Script Execution Completed"