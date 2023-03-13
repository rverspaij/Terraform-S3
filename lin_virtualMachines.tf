resource "azurerm_linux_virtual_machine" "virtualMachine" {
  count = var.vm_count
  name = "${var.projName}-vm-${count.index}"
  location = var.default_location
  resource_group_name = azurerm_resource_group.rg.name
  size = "Standard_1Bs"
  admin_username = "AdminRaoul"
  admin_password = "Admin01!Raoul"

  network_interface_ids = [azurerm_network_interface.nic[count.index].id]

  os_disk {
    name = "vm-osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "Latest"
  }
}