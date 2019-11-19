
function OnProductChange
{
    $prop["Product"].Add_PropertyChanged({
        GetTypesByProduct
    })
}

function GetProducts
{
    $products = @("MX012","MX455","PX111","PX332")
    return $products
}

function GetTypesByProduct
{
    if($prop["Product"].Value -eq "MX012"){
        $products = @("12-A","12-B","12-C")
    }
    if($prop["Product"].Value -eq "MX455"){
        $products = @("455S","455L","455XL")
    }
    if($prop["Product"].Value -eq "PX111"){
        $products = @("auto","manual")
    }
    if($prop["Product"].Value -eq "PX332"){
        $products = @("blue","red","orange","yellow")
    }
    $dsWindow.FindName("ProductTypes").ItemsSource = $products
}

