#This script creates an inventory of the lists and libraries in a site, similar to what's available in the Site Contents page

$siteUrl = "https://mytenant.sharepoint.com/sites/demo"

$cred = Get-Credential
Connect-PnPOnline -Url $siteUrl -Credentials $cred
 
#the following is required to load the corresponding list templates for each list/library
$ctx = Get-PnPContext
$templates = (Get-PnPWeb).ListTemplates
$ctx.Load($templates)
$ctx.ExecuteQuery()
 
Get-PnPList | select Title, @{label="Url";Expression={$_.RootFolder.ServerRelativeUrl}},`
              @{label="Type";Expression={$bt=$_.BaseTemplate;$templates |`
              Where{$_.ListTemplateTypeKind -eq $bt} | foreach{$_.Name}}},`
              ItemCount, LastItemModifiedDate | Export-Csv .\ListInfo.csv
