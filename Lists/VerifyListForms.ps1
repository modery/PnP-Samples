# This script checks all lists in all subsites and verifies if the lists have the three forms (View, Edit, New) set.
# If at least one of them is not available, the script will log the list to a report file
# Missing forms may occur due to migration errors, as an example

# List of sites that should be checked (also checks their subsites)
$sites = @("https://mytenant.sharepoint.com/sites/site1", "https://mytenant.sharepoint.com/sites/site2")

#Lists that should not be checked
$SkipLists = @("Workflow History", "MicroFeed", "Composed Looks", "Master Page Gallery", "Access Requests",
				"Content type publishing error log", "Converted Forms", "Maintenance Log Library", "Solution Gallery",
				"User Information List", "Reporting Metadata", "Reporting Templates", "Sharing Links", "Cache Profiles", "Long Running Operation Status",
				"Theme Gallery","List Template Gallery", "wfpub", "Maintenance Log Library", "appdata", "appfiles")


$cred = get-credential

function confirmLists($filename) {
	write-host "Confirming lists for $((get-pnpweb).ServerRelativeUrl)"
	$lists = get-pnplist -Includes DefaultDisplayFormUrl, DefaultEditFormUrl, DefaultNewFormUrl
	foreach($list in $lists) {
		If ((($SkipLists | %{$List.Title -eq $_}) -contains $true)-ne $true) {
			if((($list.DefaultDisplayFormUrl -eq $null) -or ($list.DefaultEditFormUrl -eq $null)) -or ($list.DefaultNewFormUrl -eq $null)) {
				$list.RootFolder.ServerRelativeUrl | Out-File -Append -FilePath $filename
			}
		}
	}
}

foreach($site in $sites) {
	Connect-pnponline -Url $site -Credentials $cred
	$safename = (get-pnpweb).ServerRelativeUrl -replace "/","-"
	confirmLists(".\FormsReport $($safename).txt")
	$allsubwebs = get-pnpsubwebs -recurse
	foreach($web in $allsubwebs) {
		Connect-pnponline -Url $web.Url -Credentials $cred
		confirmLists(".\FormsReport $($safename).txt")
	}
}
