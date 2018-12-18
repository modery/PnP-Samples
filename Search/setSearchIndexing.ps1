# This script sets the "Indexing Site Content" setting under "Search and Offline Availability"
# "Specify whether this site should be visible in search results. If a site is not visible to search,
# then content from that site and all of its subsites will not appear in search results."

$cred = Get-Credential
Connect-PnPOnline -Url "https://mytenant.sharepoint.com/sites/testsite" -Credentials $cred
$web = get-pnpweb
$allprops = Get-PnPProperty -ClientObject $web -Property AllProperties
#set this propert to "true" to prevent indexing; set it to "false" to allow indexing
$web.AllProperties["NoCrawl"] = "true"
$web.Update()
write-host "Updating NoCrawl property"
Invoke-PnPQuery
Disconnect-PnPOnline
