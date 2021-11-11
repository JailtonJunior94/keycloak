resource "azurerm_postgresql_server" "keycloak_postgresql" {
  name                = "keycloak-db-server"
  location            = azurerm_resource_group.keycloak_rg.location
  resource_group_name = azurerm_resource_group.keycloak_rg.name

  sku_name = "B_Gen5_1"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "11"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "keycloak_database" {
  name                = "keycloak"
  resource_group_name = azurerm_resource_group.keycloak_rg.name
  server_name         = azurerm_postgresql_server.keycloak_postgresql.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
