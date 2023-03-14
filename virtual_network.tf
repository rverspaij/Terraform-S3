resource "azurerm_virtual_network" "vnet" {
  name                = "${var.projName}-vnet"
  location            = var.default_location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "dmz" {
  name                 = "${var.projName}-dmz"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [ "10.0.1.0/24" ]
}