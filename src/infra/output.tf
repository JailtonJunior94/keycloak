output "postgresql_user" {
  value = azurerm_postgresql_server.keycloak_postgresql.administrator_login
}

output "postgresql_password" {
  value = nonsensitive(azurerm_postgresql_server.keycloak_postgresql.administrator_login_password)
}

output "postgresql_addr" {
  value = azurerm_postgresql_server.keycloak_postgresql.fqdn
}

output "postgresql_database" {
  value = azurerm_postgresql_database.keycloak_database.name
}
