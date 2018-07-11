#Retrieves size information for all site collections in a tenant and exports it to a CSV file

$siteUrl = "https://mytenant-admin.sharepoint.com" 

$cred = Get-Credential
Connect-PnPOnline -Url $siteUrl -Credentials $cred
$sites = Get-PnPTenantSite -Detailed | select Url, StorageUsage, StorageMaximumLevel, @{label="Usage in %";Expression={[math]::Round($_.StorageUsage*100/$_.StorageMaximumLevel,2)}}
$sites | Export-Csv .\SiteStorage.csv
