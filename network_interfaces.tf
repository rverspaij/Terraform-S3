resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.projName}-nic-${count.index}"
  location            = var.default_location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "DMZ-ipconfig"
    subnet_id                     = azurerm_subnet.DMZ.id
    private_ip_address_allocation = "Dynamic"
  }
}