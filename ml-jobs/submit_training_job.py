from google.cloud import aiplatform

PROJECT_ID = "oliveeb-sandbox"
REGION = "us-central1"


BUCKET_URI = "gs://machine_learning_bucket_central"
DATA_PATH = f"{BUCKET_URI}/datasets/tasks/tasks_with_embeddings.csv"
MODEL_OUTPUT_DIR = f"{BUCKET_URI}/models/task_estimator"
aiplatform.init(
    project=PROJECT_ID,
    location=REGION,
    staging_bucket=BUCKET_URI
)

TRAINING_IMAGE = (
    "us-central1-docker.pkg.dev/"
    "oliveeb-sandbox/"
    "ml-training-images/"
    "task-trainer:latest"
)

job = aiplatform.CustomContainerTrainingJob(
    display_name="task-estimation-training",
    container_uri=TRAINING_IMAGE,
)

job.run(
    args=[
        "--data-path", DATA_PATH,
        "--model-dir", MODEL_OUTPUT_DIR,
    ],
    replica_count=1,
    machine_type="n1-standard-4",
)
