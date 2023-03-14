resource "azurerm_linux_virtual_machine" "virtualMachine" {
  count = var.vm_count
  name = "${var.projName}-vm-${count.index}"
  location = var.default_location
  resource_group_name = azurerm_resource_group.rg.name
  size = "Standard_B1s"
  admin_username = var.userName
  admin_password = var.password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nic[count.index].id]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }

  depends_on = [
    azurerm_network_interface.nic
  ]
}