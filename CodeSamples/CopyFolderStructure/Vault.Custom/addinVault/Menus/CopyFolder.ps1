
$folderId=$vaultContext.CurrentSelectionSet[0].Id

[AppDomain]::CurrentDomain.SetData("FolderToCopy",$folderId)

