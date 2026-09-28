param(
    [string]$Version
)

# Make sure manifests show next version number, in both primary and dependencies
$ver = $Version.replace('_', '.')

If (!$PSBoundParameters.ContainsKey('Version')) {
    Write-Host "-Version parameter must be set, and it must be formatted 1_0_0"
    exit 1
}

$vArray = $Version.Split("_")
if ($vArray.Count -ne 3) {
    Write-Host "-Version parameter must be formatted 1_0_0"
    exit 1
}

# Setup file pointers
$tofp_bp = "TheOreFinderProject BP\manifest.json"
$tofp_rp = "TheOreFinderProject RP\manifest.json"
$tofp_ee_bp = "TOFP EE BP\manifest.json"
$tofp_ee_rp = "TOFP EE RP\manifest.json"

# Setup a backup folder and backup the current manifests
$backupRoot = Join-Path $PSScriptRoot "_backup"
if (!(Test-Path $backupRoot)) {
    New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
}

$tofp_bp_backup = Join-Path $backupRoot "TOFP_BP_manifest.json"
$tofp_rp_backup = Join-Path $backupRoot "TOFP_RP_manifest.json"
$tofp_ee_bp_backup = Join-Path $backupRoot "TOFP_EE_BP_manifest.json"
$tofp_ee_rp_backup = Join-Path $backupRoot "TOFP_EE_RP_manifest.json"

# do the backups
Copy-Item $tofp_bp $tofp_bp_backup -Force
Copy-Item $tofp_rp $tofp_rp_backup -Force
Copy-Item $tofp_ee_bp $tofp_ee_bp_backup -Force
Copy-Item $tofp_ee_rp $tofp_ee_rp_backup -Force

# We need an array of integers, not strings
$intArray = @()
foreach ($item in $vArray) {
    $intArray += [int]$item
}

$BPL_UUID = '744d717c-e229-40e7-9ead-b693faa9cc0c' # Behavior Pack Live UUID
$BPD_UUID = '84eb68c8-1ff7-42ba-b591-e7b856b7eb4f' # Behavior Pack Dev UUID
$RPL_UUID = 'abbd0d2c-9ae4-4368-a714-60d988b9dcc9' # Resource Pack Live UUID
$RPD_UUID = '75b067b9-59db-4a36-99b6-98bd58556af7' # Resource Pack Dev UUID

$EEBPL_UUID = 'db186209-7bae-4b19-aa5a-033b8993c732' # Behavior Pack Live UUID
$EEBPD_UUID = '56ce5803-d214-41ef-b801-722140e7f2aa' # Behavior Pack Dev UUID
$EERPL_UUID = 'e67d7bda-6394-4c14-8327-3a58fa364fb0' # Resource Pack Live UUID
$EERPD_UUID = '6508ff30-7eb0-4cf5-ac6c-515defbf3a58' # Resource Pack Dev UUID


# update the BP manifest to live settings
$data = Get-Content $tofp_bp | ConvertFrom-Json
$data.header.name = '§2The Ore Finder Project - BP'
$data.header.description = "Goggles that highlight nearby ores.`n§b1.21.100+ §7- by §dThe Nether Monk §7- §gv$ver";
$data.header.uuid = $BPL_UUID
$data.header.version = $intArray
$data.dependencies[0].uuid = $RPL_UUID
$data.dependencies[0].version = $intArray
$updatedJsonContent = $data | ConvertTo-Json -Depth 5 -Compress
Set-Content -Path $tofp_bp -Value $updatedJsonContent

# update the RP manifest to live settings
$data = Get-Content $tofp_rp | ConvertFrom-Json
$data.header.name = '§2The Ore Finder Project - RP'
$data.header.description = "Goggles that highlight nearby ores.`n§b1.21.100+ §7- by §dThe Nether Monk §7- §gv$ver";
$data.header.uuid = $RPL_UUID
$data.header.version = $intArray
$data.dependencies[0].uuid = $BPL_UUID
$data.dependencies[0].version = $intArray
$updatedJsonContent = $data | ConvertTo-Json -Depth 5 -Compress
Set-Content -Path $tofp_rp -Value $updatedJsonContent

# build the zip
Compress-Archive -Path "TheOreFinderProject BP", "TheOreFinderProject RP" -DestinationPath "TheOreFinderProject_$Version.zip"

# rename it to what we need
Move-Item -Path "TheOreFinderProject_$Version.zip" -Destination "TheOreFinderProject_$Version.mcaddon" -Force

# update the BP manifest back to dev settings
#$data = Get-Content "TheOreFinderProject BP\manifest.json" | ConvertFrom-Json
#$data.header.name = "§2The Ore Finder Project - DBP"
#$data.header.description = "Goggles that highlight nearby ores.`n§b1.21.100+ §7- by §dThe Nether Monk §7- §gv$ver";
#$data.header.uuid = $BPD_UUID
#$data.header.version = $intArray
#$data.dependencies[0].uuid = $RPD_UUID
#$data.dependencies[0].version = $intArray
#$updatedJsonContent = $data | ConvertTo-Json -Depth 5
#Set-Content -Path "TheOreFinderProject BP\manifest.json" -Value $updatedJsonContent

# update the RP manifest back to dev settings
#$data = Get-Content "TheOreFinderProject RP\manifest.json" | ConvertFrom-Json
#$data.header.name = "§2The Ore Finder Project - DRP"
#$data.header.description = "Goggles that highlight nearby ores.`n§b1.21.100+ §7- by §dThe Nether Monk §7- §gv$ver";
#$data.header.uuid = $RPD_UUID
#$data.header.version = $intArray
#$data.dependencies[0].uuid = $BPD_UUID
#$data.dependencies[0].version = $intArray
#$updatedJsonContent = $data | ConvertTo-Json -Depth 5
#Set-Content -Path "TheOreFinderProject RP\manifest.json" -Value $updatedJsonContent


#### Now do the same for the EE pack
# update the BP manifest to live settings
$data = Get-Content $tofp_ee_bp | ConvertFrom-Json
$data.header.name = '§2TOFP - Eternal End - BP'
$data.header.description = "Add Eternal End ores to TOFP.`n§b1.21.100+ §7- by §dThe Nether Monk §7- §gv$ver";
$data.header.uuid = $EEBPL_UUID
$data.header.version = $intArray
$data.dependencies[0].uuid = $EERPL_UUID
$data.dependencies[0].version = $intArray
$updatedJsonContent = $data | ConvertTo-Json -Depth 5 -Compress
Set-Content -Path $tofp_ee_bp -Value $updatedJsonContent

# update the RP manifest to live settings
$data = Get-Content $tofp_ee_rp | ConvertFrom-Json
$data.header.name = '§2TOFP - Eternal End - RP'
$data.header.description = "Add Eternal End ores to TOFP.`n§b1.21.100+ §7- by §dThe Nether Monk §7- §gv$ver";
$data.header.uuid = $EERPL_UUID
$data.header.version = $intArray
$data.dependencies[0].uuid = $EEBPL_UUID
$data.dependencies[0].version = $intArray
$updatedJsonContent = $data | ConvertTo-Json -Depth 5 -Compress
Set-Content -Path $tofp_ee_rp -Value $updatedJsonContent

# build the zip
Compress-Archive -Path "TOFP EE BP", "TOFP EE RP" -DestinationPath "TOFP_EE_$Version.zip"

# rename it to what we need
Move-Item -Path "TOFP_EE_$Version.zip" -Destination "TOFP_EE_$Version.mcaddon" -Force

# update the BP manifest back to dev settings
#$data = Get-Content "TOFP EE BP\manifest.json" | ConvertFrom-Json
#$data.header.name = "§2TOFP - Eternal End - DBP"
#$data.header.description = "Add Eternal End ores to TOFP.`n§b1.21.100+ §7- by §dThe Nether Monk §7- §gv$ver";
#$data.header.uuid = $EEBPD_UUID
#$data.header.version = $intArray
#$data.dependencies[0].uuid = $EERPD_UUID
#$data.dependencies[0].version = $intArray
#$updatedJsonContent = $data | ConvertTo-Json -Depth 5
#Set-Content -Path "TOFP EE BP\manifest.json" -Value $updatedJsonContent

# update the RP manifest back to dev settings
#$data = Get-Content "TOFP EE RP\manifest.json" | ConvertFrom-Json
#$data.header.name = "§2TOFP - Eternal End - DRP"
#$data.header.description = "Add Eternal End ores to TOFP.`n§b1.21.100+ §7- by §dThe Nether Monk §7- §gv$ver";
#$data.header.uuid = $EERPD_UUID
#$data.header.version = $intArray
#$data.dependencies[0].uuid = $EEBPD_UUID
#$data.dependencies[0].version = $intArray
#$updatedJsonContent = $data | ConvertTo-Json -Depth 5
#Set-Content -Path "TOFP EE RP\manifest.json" -Value $updatedJsonContent


# Restore the dev backups
Copy-Item $tofp_bp_backup $tofp_bp -Force
Copy-Item $tofp_rp_backup $tofp_rp -Force
Copy-Item $tofp_ee_bp_backup $tofp_ee_bp -Force
Copy-Item $tofp_ee_rp_backup $tofp_ee_rp -Force

Write-Host "DONE!"

