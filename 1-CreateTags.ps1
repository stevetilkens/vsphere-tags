## Script function: Create vSphere Tags based on input file
## Author: Steve Tilkens - stilkens@vmware.com
## Connect to vCenter
$vc = @(Read-Host "Please enter the vCenter server")
"Please enter your vCenter credentials"
$creds = get-credential
Connect-VIServer -server $vc -credential $creds -WarningAction 0

## Import tag list
$tags = Import-CSV C:\Scripts\Tags\Tags.csv

## Create Tags
ForEach ($item in $tags)
{
    $Name = $item.Name
    $Desc = $item.Description
    $Category = $item.Category
    Write-Host ".... Creating $Name "
    New-Tag -Name $Name -Description $Desc -Category $Category
}