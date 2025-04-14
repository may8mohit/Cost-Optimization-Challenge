import azure.functions as func
import azure.durable_functions as df

def orchestrator_function(context: df.DurableOrchestrationContext):
    records = yield context.call_activity("get_old_records")
    
    for record in records:
        yield context.call_activity("archive_to_blob", record)
        yield context.call_activity("delete_from_cosmos", record)

    return f"Archived and deleted {len(records)} records."

main = df.Orchestrator.create(orchestrator_function)
