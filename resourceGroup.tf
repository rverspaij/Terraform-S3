resource "azurerm_resource_group" "rg" {
  name     = "${var.projName}-rg"
  location = var.default_location
}