from azure.storage.blob import BlobServiceClient
import json
import os

def main(record: dict):
    connection_string = os.getenv("BLOB_CONN_STR")
    blob_service = BlobServiceClient.from_connection_string(connection_string)
    container = blob_service.get_container_client("billing-archive")

    year, month = record["timestamp"].split("T")[0].split("-")[:2]
    blob_path = f"year={year}/month={month}/{record['id']}.json"

    blob = container.get_blob_client(blob_path)
    blob.upload_blob(json.dumps(record), overwrite=True)
