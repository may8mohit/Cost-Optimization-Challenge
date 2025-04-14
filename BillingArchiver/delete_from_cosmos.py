from azure.cosmos import CosmosClient
import os

def main(record: dict):
    endpoint = os.getenv("COSMOS_DB_ENDPOINT")
    key = os.getenv("COSMOS_DB_KEY")
    client = CosmosClient(endpoint, key)
    db = client.get_database_client("BillingDB")
    container = db.get_container_client("BillingRecords")
    container.delete_item(record['id'], partition_key=record['partitionKey'])
