
function ListAllDrawings($xamlFile){
	if ($VaultContext.SelectedObject.TypeId.SelectionContext -eq "FileMaster" -and $xamlFile -eq "Drawings.xaml"){
		$selectedFileId = $vaultContext.SelectedObject.Id
		#$file = $vault.DocumentService.GetLatestFileByMasterId($selectedFileId)
		$fileAssocs = $vault.DocumentService.GetLatestFileAssociationsByMasterIds(@($selectedFileId),"None",$false,"Dependency",$true,$true,$false,$false)
		$drawings = @()
		if($null -ne $fileAssocs[0].FileAssocs){
			foreach($assoc in $fileAssocs[0].FileAssocs){
				if($assoc.ParFile.Name.EndsWith(".idw")){
					$drawings += $assoc.ParFile
				}
			}
		}
		$dsWindow.FindName("ListOfDrawings").ItemsSource = $drawings
	}
}

