# This script recursively deletes all subsites for a given site and the site itself
#  If it's the root site of the site collection, it will simply delete all subsites and throw an error for the root site: Remove-PnPWeb : Cannot delete top-level site

$cred = get-credential

function RemoveSPWebRecursively($web) {
	$subwebs = Get-pnpSubWebs -web $web 
	foreach($subweb in $subwebs) {
		RemoveSPWebRecursively($subweb)
	}
  
	Write-Host "Deleting " $web.Url
	Write-Host $web.Id
	Remove-PnPWeb -Identity $web.Id  -Force
}

#specify the URL of the site from which to start
$url = "https://mytenant.sharepoint.com/sites/testsite"
Connect-PnPOnline –Url $url –Credentials $cred
RemoveSPWebRecursively (Get-PnPWeb)
