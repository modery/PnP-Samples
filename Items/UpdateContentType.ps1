# This function updates all items in a given list/library from one content type to another. Note that no other metadata updates are done.
# Example:
# UpdateDocuments https://example.sharepoint.com/sites/examplesite "MyList" "Original Content Type Document" "New Content Type Document"

function UpdateDocuments($webUrl, $libName, $oldCTName, $newCTName) {
    $web = get-pnpweb $webUrl
    $lib = $web.Lists[$libName]
	  if($lib) {
		  write-host "Updating $($libName) in $($webUrl)"
		  $ctOld = $lib.ContentTypes[$oldCTName]
		  $ctNew = $lib.ContentTypes[$newCTName]
		  if($ctOld -And $ctNew) {
			  write-host "Updating items"
			  $items = $lib.Items 
			  foreach($item in $items) {
				if($item.ContentType.Id -eq $ctOld.Id) {
				  write-host "Updating $($item.Id)"
				  $item["ContentTypeId"]=$ctNew.Id
				  $item.SystemUpdate()
				}
			}
		}
	}
}
