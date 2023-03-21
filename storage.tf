resource "azurerm_storage_account" "appstore" {
  name = "appstore912094"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.default_location
  access_tier = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = true
}

resource "azurerm_storage_container" "data" {
  name = "data"
  storage_account_name = azurerm_storage_account.appstore.name
  container_access_type = "blob"
  
  depends_on = [
    azurerm_storage_account.appstore
  ]
}

resource "azurerm_storage_blob" "Apache2_bash_script" {
  name = "Apache2_bash_script.sh"
  storage_account_name = azurerm_storage_account.appstore.name
  storage_container_name = azurerm_storage_container.data.name
  type = "Block"
  source = "Apache2_bash_script.sh"
  
  depends_on = [
    azurerm_storage_container.data
  ]
}