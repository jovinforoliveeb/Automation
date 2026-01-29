from google.cloud import aiplatform

PROJECT_ID = "oliveeb-sandbox"
REGION = "us-central1"

aiplatform.init(
    project=PROJECT_ID,
    location=REGION,
)

ARTIFACT_URI = "gs://machine_learning_bucket_central/models/task_estimator/"

SERVING_IMAGE = (
    "us-central1-docker.pkg.dev/"
    "oliveeb-sandbox/"
    "ml-models/"
    "task-predictor:v1"
)

model = aiplatform.Model.upload(
    display_name="task-price-duration-predictor",
    artifact_uri=ARTIFACT_URI,
    serving_container_image_uri=SERVING_IMAGE,
    serving_container_predict_route="/predict",
    serving_container_health_route="/health",
    description="Predicts token_amount_usd and duration_minutes for tasks",
    sync=True,
)

print("✅ Model uploaded successfully!")
print(f"Model resource name: {model.resource_name}")
