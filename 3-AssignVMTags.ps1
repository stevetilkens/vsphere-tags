## Script function: Assign tags to VMs based on input file
## Author: Steve Tilkens - stilkens@vmware.com
## Connect to vCenter
$vc = @(Read-Host "Please enter the vCenter server")
"Please enter your vCenter credentials"
$creds = get-credential
Connect-VIServer -server $vc -credential $creds -WarningAction 0

## Import tag assignments
$tagAssignments = Import-CSV C:\Scripts\Tags\VMTagAssignments.csv

## Assign tags to VMs
ForEach ($item in $tagAssignments)
{
    $Name = $item.Name
    $Tag = $item.Tag
    Write-Host ".... Assigning $Tag to $Name "
    $VM = Get-VM -Name $Name
    New-TagAssignment -Entity $VM -Tag $Tag
}