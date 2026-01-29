terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Default Compute Service Account
locals {
  vertex_sa = "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com"
}

# ---------------------------
# GCS Bucket Permissions
# ---------------------------
resource "google_storage_bucket_iam_member" "bucket_admin" {
  bucket = var.bucket_name
  role   = "roles/storage.objectAdmin"
  member = local.vertex_sa
}

# ---------------------------
# Artifact Registry Permissions
# ---------------------------
resource "google_artifact_registry_repository_iam_member" "artifact_reader" {
  project    = var.project_id
  location   = var.region
  repository = var.artifact_repo
  role       = "roles/artifactregistry.reader"
  member     = local.vertex_sa
}

# ---------------------------
# Vertex AI Permissions
# ---------------------------
resource "google_project_iam_member" "vertex_ai_user" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = local.vertex_sa
}
