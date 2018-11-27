## Script function: Assign tags to hosts based on input file
## Author: Steve Tilkens - stilkens@vmware.com
## Connect to vCenter
$vc = @(Read-Host "Please enter the vCenter server")
"Please enter your vCenter credentials"
$creds = get-credential
Connect-VIServer -server $vc -credential $creds -WarningAction 0

## Import tag assignments
$tagAssignments = Import-CSV C:\Scripts\Tags\HostTagAssignments.csv

## Assign tags to hosts
ForEach ($item in $tagAssignments)
{
    $Name = $item.Name
    $Tag = $item.Tag
    Write-Host ".... Assigning $Tag to $Name "
    $ESXhost = Get-VMHost -Name $Name
    New-TagAssignment -Entity $ESXhost -Tag $Tag
}