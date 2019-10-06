#Opprette resource group

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"

New-AzResourceGroup -Name $resourceGroupName -Location $location

Get-AzResourceGroup -Name $resourceGroupName

#opprette vnet

$virtualNetwork = New-AzVirtualNetwork `
  -ResourceGroupName $resourceGroupName `
  -Location $location `
  -Name $resourceGroupName'-vnet' `
  -AddressPrefix 10.0.0.0/16

#opprette subnet

$subnetConfig = Add-AzVirtualNetworkSubnetConfig `
  -Name default `
  -AddressPrefix 10.0.0.0/24 `
  -VirtualNetwork $virtualNetwork

#opprette assosiasjon mellom subnett og vnet

$virtualNetwork | Set-AzVirtualNetwork
