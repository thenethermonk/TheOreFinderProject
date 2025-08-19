# Make sure manifests show next version number, in both primary and dependencies
param(
    [string]$Version
)

If (!$PSBoundParameters.ContainsKey('Version')) {
    Write-Host "-Version parameter must be set, and it must be formatted 1_0_0"
    exit 1
}

$vArray = $Version.Split("_")
if ($vArray.Count -ne 3) {
    Write-Host "-Version parameter must be formatted 1_0_0"
    exit 1
}

# We need an array of integers, not strings
$intArray = @()
foreach ($item in $vArray) {
    $intArray += [int]$item
}

$BPL_UUID = '744d717c-e229-40e7-9ead-b693faa9cc0c' # Behavior Pack Live UUID
$BPD_UUID = '84eb68c8-1ff7-42ba-b591-e7b856b7eb4f' # Behavior Pack Dev UUID
$RPL_UUID = 'abbd0d2c-9ae4-4368-a714-60d988b9dcc9' # Resource Pack Live UUID
$RPD_UUID = '75b067b9-59db-4a36-99b6-98bd58556af7' # Resource Pack Dev UUID

# update the BP manifest to live settings
$data = Get-Content 'TheOreFinderProject BP\manifest.json' | ConvertFrom-Json
$data.header.name = '§2The Ore Finder Project - BP'
$data.header.uuid = $BPL_UUID
$data.header.version = $intArray
$data.dependencies[0].uuid = $RPL_UUID
$data.dependencies[0].version = $intArray
$updatedJsonContent = $data | ConvertTo-Json -Depth 5 -Compress
Set-Content -Path 'TheOreFinderProject BP\manifest.json' -Value $updatedJsonContent

# update the RP manifest to live settings
$data = Get-Content 'TheOreFinderProject RP\manifest.json' | ConvertFrom-Json
$data.header.name = '§2The Ore Finder Project - RP'
$data.header.uuid = $RPL_UUID
$data.header.version = $intArray
$data.dependencies[0].uuid = $BPL_UUID
$data.dependencies[0].version = $intArray
$updatedJsonContent = $data | ConvertTo-Json -Depth 5 -Compress
Set-Content -Path 'TheOreFinderProject RP\manifest.json' -Value $updatedJsonContent

# build the zip
Compress-Archive -Path "TheOreFinderProject BP", "TheOreFinderProject RP" -DestinationPath "TheOreFinderProject_$Version.zip"

# rename it to what we need
Move-Item -Path "TheOreFinderProject_$Version.zip" -Destination "TheOreFinderProject_$Version.mcaddon" -Force

# update the BP manifest back to dev settings
$data = Get-Content 'TheOreFinderProject BP\manifest.json' | ConvertFrom-Json
$data.header.name = '§2The Ore Finder Project - DBP'
$data.header.uuid = $BPD_UUID
$data.header.version = $intArray
$data.dependencies[0].uuid = $RPD_UUID
$data.dependencies[0].version = $intArray
$updatedJsonContent = $data | ConvertTo-Json -Depth 5
Set-Content -Path 'TheOreFinderProject BP\manifest.json' -Value $updatedJsonContent

# update the RP manifest back to dev settings
$data = Get-Content 'TheOreFinderProject RP\manifest.json' | ConvertFrom-Json
$data.header.name = '§2The Ore Finder Project - DRP'
$data.header.uuid = $RPD_UUID
$data.header.version = $intArray
$data.dependencies[0].uuid = $BPD_UUID
$data.dependencies[0].version = $intArray
$updatedJsonContent = $data | ConvertTo-Json -Depth 5
Set-Content -Path 'TheOreFinderProject RP\manifest.json' -Value $updatedJsonContent

Write-Host "DONE!"