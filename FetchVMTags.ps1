## Script function: List all VM Tag Associations
## Author: Steve Tilkens - stilkens@vmware.com
## Connect to vCenter
$vc = @(Read-Host "Please enter the vCenter server")
"Please enter your vCenter credentials"
$creds = get-credential
connect-viserver -server $vc -credential $creds -WarningAction 0

## Export VM Tag associations in text format
#Get-VM | Get-TagAssignment | Out-file "C:\Scripts\Tags\Export-VMTags.txt"

## Export VM Tag associations in csv format
Get-VM | Get-TagAssignment | Export-Csv "C:\Scripts\Tags\Export-VMTags.csv" -NoTypeInformation