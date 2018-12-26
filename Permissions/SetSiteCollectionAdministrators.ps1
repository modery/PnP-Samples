# Sets a list of site collection administrators on specified sites (selected via filter) in the current tenant

#comma separated list of users and groups to be added
$adminAccounts = "support@mytenant.onmicrosoft.com","superadmin@mytenant.onmicrosoft.com
 
#Specify the tenant here
$tenant = "mytenant"
 
# Note: If you run this script regularly, please have a look at the following site to see how you can store credentials securely in Windows
# https://github.com/OfficeDev/PnP-PowerShell#settings-up-credentials
$cred = Get-Credential
 
write-host "Connecting to https://$($tenant)-admin.sharepoint.com"
Connect-PnPOnline -Url "https://$($tenant)-admin.sharepoint.com" -Credentials $cred
write-host "Getting list of site collections"
 
#Note: we are only fetching the root site collection and any site collection in the /sites/ path
#Update filters here accordingly to match your requirements
$sitecollections = Get-PnPTenantSite | where {($_.Url -like "*$($tenant).sharepoint.com/") -or ($_.Url -like "*$($tenant).sharepoint.com/sites/*")}
 
foreach($sitecollection in $sitecollections) {
    write-host "Adding administrators to $($sitecollection.Url)"
    Set-PnPTenantSite -Url $sitecollection.Url -Owners $adminAccounts
}
