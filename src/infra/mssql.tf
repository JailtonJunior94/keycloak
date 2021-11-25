resource "azurerm_mssql_server" "keycloak_mssql_server" {
  name                         = "keycloak-sqlserver"
  resource_group_name          = azurerm_resource_group.keycloak_rg.name
  location                     = azurerm_resource_group.keycloak_rg.location
  version                      = "12.0"
  administrator_login          = "KeycloakAdmin"
  administrator_login_password = "2021@Keycl0@k"
}

resource "azurerm_mssql_database" "keycloak_mssql_database" {
  name         = "Keycloak"
  server_id    = azurerm_mssql_server.keycloak_mssql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "Basic"
}