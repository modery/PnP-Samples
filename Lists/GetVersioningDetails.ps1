#This script retrieves all versioning details from all lists in a provided site, including
#'Require Content Approval','Versioning Enabled','Major Version limit','Draft Version limit',
#'Drafts visible to', and 'Checkout required' 

$siteUrl = "https://mytenant.sharepoint.com/sites/testsite"

$cred = Get-Credential
Connect-PnPOnline -url $siteUrl -credentials $cred
 
$lists = Get-PnPList
 
$VersioningDetails = @()
foreach($list in $lists) {
    $VersioningDetails += New-Object PSObject -Property @{
        'List' = $list.Title
        'Require Content Approval' = $list.EnableModeration
        'Versioning Enabled' = $list.EnableVersioning
        'Major Version limit' = $list.MajorVersionLimit
        'Draft Version limit' = $list.MajorWithMinorVersionsLimit
        'Drafts visible to' = $list.DraftVersionVisibility
        'Checkout required' = $list.ForceCheckout
    }
}
 
$VersioningDetails | Select 'List', 'Require Content Approval', 'Versioning Enabled',`
'Major Version limit', 'Draft Version limit', 'Drafts visible to', 'Checkout required'`
| Export-Csv .\versioningdetails.csv
