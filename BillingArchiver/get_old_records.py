from azure.cosmos import CosmosClient
import datetime
import os

def main(name: str) -> list:
    endpoint = os.getenv("COSMOS_DB_ENDPOINT")
    key = os.getenv("COSMOS_DB_KEY")
    client = CosmosClient(endpoint, key)
    db = client.get_database_client("BillingDB")
    container = db.get_container_client("BillingRecords")

    # Get ISO time 3 months ago
    three_months_ago = (datetime.datetime.utcnow() - datetime.timedelta(days=90)).isoformat()

    query = f"SELECT * FROM c WHERE c.timestamp < '{three_months_ago}'"
    items = list(container.query_items(query, enable_cross_partition_query=True))
    return items
