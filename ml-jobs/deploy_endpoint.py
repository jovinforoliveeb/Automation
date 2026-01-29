from google.cloud import aiplatform

PROJECT_ID = "oliveeb-sandbox"
REGION = "us-central1"

aiplatform.init(
    project=PROJECT_ID,
    location=REGION,
)

MODEL_ID = "1506303442262425600"
model = aiplatform.Model(model_name=MODEL_ID)

endpoint = aiplatform.Endpoint.create(
    display_name="task-estimation-endpoint"
)

endpoint.deploy(
    model=model,
    deployed_model_display_name="task-estimator-v1",
    machine_type="n1-standard-4",
    min_replica_count=1,
    max_replica_count=2,
    traffic_percentage=100,
)

print("✅ Endpoint created and model deployed!")
print(f"Endpoint resource name: {endpoint.resource_name}")
