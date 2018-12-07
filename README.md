# PnP-Samples
Sample scripts for the [PnP PowerShell cmdlets](https://github.com/SharePoint/PnP-PowerShell). These scripts were developed by myself and used in real-life scenarios, but are often kept simple (e.g., they usually don't use parameters; variables are set directly in the script). Feel free to submit Issues or Pull Requests to improve them


## Lists
Script|Description
:-----|:----------
**[GetListDetails](https://github.com/modery/PnP-Samples/blob/master/Lists/GetListDetails.ps1)** | This script creates an inventory of the lists and libraries in a site, similar to what's available in the Site Contents page
**[GetVersioningDetails](https://github.com/modery/PnP-Samples/blob/master/Lists/GetVersioningDetails.ps1)** | This script retrieves all versioning details from all lists in a provided site, including 'Require Content Approval','Versioning Enabled','Major Version limit','Draft Version limit', 'Drafts visible to', and 'Checkout required' 
**[GetVersioningDetails](https://github.com/modery/PnP-Samples/blob/master/Lists/GetVersioningDetails.ps1)** | This script checks all lists in all subsites and verifies if the lists have the three forms (View, Edit, New) set. If at least one of them is not available, the script will log the list to a report file


## Permissions
Script|Description
:-----|:----------
**[GetPermissionLevels](https://github.com/modery/PnP-Samples/blob/master/Permissions/GetPermissionLevels.ps1)** | Retrieves the permission levels from all site collections (excluding OneDrive) and stores them in a CSV file

## Search
Script|Description
:-----|:----------
**[SetSiteCollectionSearchSettings](https://github.com/modery/PnP-Samples/blob/master/Search/SetSiteCollectionSearchSettings.ps1)** | This script sets the search center URL as well as the seach results page URL for a given site collection  

## Sites
Script|Description
:-----|:----------
**[GetSiteCollectionStorageDetails](https://github.com/modery/PnP-Samples/blob/master/Sites/GetSiteCollectionStorageDetails.ps1)** | Retrieves size information for all site collections in a tenant and exports it to a CSV file
