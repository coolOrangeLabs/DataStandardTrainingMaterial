﻿
function OnTabContextChanged
{
	$xamlFile = [System.IO.Path]::GetFileName($VaultContext.UserControl.XamlFile)

	ListAllDrawings -xamlFile $xamlFile #call the function for collecting all drawings

	if ($VaultContext.SelectedObject.TypeId.SelectionContext -eq "FileMaster" -and $xamlFile -eq "CAD BOM.xaml")
	{
		$fileMasterId = $vaultContext.SelectedObject.Id
		$file = $vault.DocumentService.GetLatestFileByMasterId($fileMasterId)
		$bom = @(GetFileBOM($file.id))
		$dsWindow.FindName("bomList").ItemsSource = $bom
	}
	if ($VaultContext.SelectedObject.TypeId.SelectionContext -eq "ItemMaster" -and $xamlFile -eq "Associated Files.xaml")
	{
		$items = $vault.ItemService.GetItemsByIds(@($vaultContext.SelectedObject.Id))
		$item = $items[0]
		$itemids = @($item.Id)
		$assocFiles = @(GetAssociatedFiles $itemids $([System.IO.Path]::GetDirectoryName($VaultContext.UserControl.XamlFile)))
		$dsWindow.FindName("AssoicatedFiles").ItemsSource = $assocFiles
	}
}

