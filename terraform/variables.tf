variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group to create."
  type        = string
  default     = "billing-archival-rg"
}

variable "cosmos_db_endpoint" {
  description = "The URI of the Cosmos DB account."
  type        = string
  sensitive   = true
}

variable "cosmos_db_key" {
  description = "The primary key of the Cosmos DB account."
  type        = string
  sensitive   = true
}

variable "blob_conn_str" {
  description = "The connection string for the Blob Storage account."
  type        = string
  sensitive   = true
}

variable "storage_account_name" {
  description = "Name of the Azure Storage account for archived blobs."
  type        = string
  default     = "billingarchivestorage"
}

variable "function_app_name" {
  description = "Name of the Function App to be created."
  type        = string
  default     = "billing-archival-fn"
}

variable "storage_container_name" {
  description = "Name of the Blob Storage container for archival."
  type        = string
  default     = "billing-archive"
}
