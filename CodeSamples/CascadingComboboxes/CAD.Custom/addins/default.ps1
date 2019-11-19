function InitializeWindow
{
    #begin rules applying commonly

    OnProductChange #this registers the trigger for filling the second combo on change of the first one

    $dsWindow.Title = SetWindowTitle
    InitializeCategory
    InitializeNumSchm
    InitializeBreadCrumb
    InitializeFileNameValidation
	#end rules applying commonly
	$mWindowName = $dsWindow.Name
	switch($mWindowName)
	{
		"InventorWindow"
		{
			#rules applying for Inventor
		}
		"AutoCADWindow"
		{
			#rules applying for AutoCAD
		}
	}
    $global:expandBreadCrumb = $true	
    

}