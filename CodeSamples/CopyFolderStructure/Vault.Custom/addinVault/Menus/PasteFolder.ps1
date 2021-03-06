$targetId=$vaultContext.CurrentSelectionSet[0].Id
$vaultContext.ForceRefresh = $true

$sourceId = [AppDomain]::CurrentDomain.GetData("FolderToCopy")

function BuildFolders($sourceId,$targetId){
    $sourceFolders = $vault.DocumentService.GetFoldersByParentId($sourceId,$false)
    foreach($sourceFolder in $sourceFolders)
    {
        $targetFolder = $vault.DocumentService.AddFolder($sourceFolder.Name,$targetId,$sourceFolder.IsLib)
        BuildFolders -sourceFolder $sourceFolder.Id -targetId $targetFolder.Id
    }
}

BuildFolders -sourceId $sourceId -targetId $targetId

