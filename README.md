# Cost-Optimization-Challenge
AZ Assignment - Symplique Solutions




# Azure Billing Archiver

This repo provides an automated system to archive Azure Cosmos DB billing records older than 3 months to Azure Blob Storage using Durable Functions, reducing costs while preserving access.

## Features

- Archives old records to Blob Storage (Cool tier)
- Deletes them from Cosmos DB post-successful upload
- Supports daily automated runs (configurable)
- Read fallback from Cosmos DB to Blob (if needed)
- Zero downtime, API-compatible

## Deployment

1. Set up resources using `terraform/`
2. Deploy Azure Functions using Azure CLI or VSCode
3. Configure `local.settings.json` for local runs
4. Monitor via Application Insights

## Folder Layout

- `BillingArchiver/` – Core Durable Function orchestration
- `terraform/` – Infra-as-code for storage and compute

