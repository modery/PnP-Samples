#This script sets the search center URL as well as the seach results page URL for a given site collection

$siteUrl = "https://mytenant.sharepoint.com/sites/mydemosite"
$SearchCenterUrl = "/search/Pages"
$SearchResultsPageUrl = "/search/Pages/results.aspx"

$cred = Get-Credential
Connect-PnPOnline -Url $siteUrl -Credentials $cred
Set-PnPPropertyBagValue -Key SRCH_ENH_FTR_URL_SITE -Value $SearchCenterUrl
Set-PnPPropertyBagValue -Key SRCH_SB_SET_SITE `
   -Value '{"Inherit":false,"ResultsPageAddress":$SearchResultsPageUrl,"ShowNavigation":false}'
