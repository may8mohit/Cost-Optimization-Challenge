resource "azurerm_resource_group" "main" {
  name     = "billing-archival-rg"
  location = "East US"
}

resource "azurerm_storage_account" "archive" {
  name                     = "billingarchivestorage"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Cool"
}

resource "azurerm_storage_container" "archive" {
  name                  = "billing-archive"
  storage_account_name  = azurerm_storage_account.archive.name
  container_access_type = "private"
}

resource "azurerm_function_app" "archiver" {
  name                       = "billing-archival-fn"
  location                   = azurerm_resource_group.main.location
  resource_group_name        = azurerm_resource_group.main.name
  app_service_plan_id        = azurerm_app_service_plan.plan.id
  storage_account_name       = azurerm_storage_account.archive.name
  storage_account_access_key = azurerm_storage_account.archive.primary_access_key
  app_settings = {
    "COSMOS_DB_ENDPOINT" = var.cosmos_db_endpoint
    "COSMOS_DB_KEY"      = var.cosmos_db_key
    "BLOB_CONN_STR"      = var.blob_conn_str
  }
}
