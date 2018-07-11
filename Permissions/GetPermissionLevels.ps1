#Retrieves the permission levels from all site collections (excluding OneDrive) and stores them in a CSV file

$tenantPrefix = "mytenant"

$cred = Get-Credential
Connect-PnPOnline -Url "https://$($tenantPrefix)-admin.sharepoint.com" -Credentials $cred
$sites = Get-PnPTenantSite | where {$_.Url -like "*$($tenantPrefix).sharepoint.com/sites/*" -or $_.Url -like "*$($tenantPrefix).sharepoint.com/teams/*"}
foreach($site in $sites) {
    Connect-PnPOnline -Url $site.Url -Credentials $cred
    $ctx = Get-PnPContext
    $roleDefs = (Get-PnPWeb).RoleDefinitions
    $ctx.Load($roleDefs)
    $ctx.ExecuteQuery()
    foreach($rd in $roleDefs) {
        Add-Content ".\permissionlevels.csv" "$($site.url), $($rd.Name)"
    }
}
