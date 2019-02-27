# this script replaces any older list icon references (e.g. used in older versions of SharePoint) to the current .png version

$list = Get-PnPList "Tasks"
$list.ImageUrl = $list.ImageUrl -replace ".gif",".png"
$list.Update()
Invoke-PnPQuery
