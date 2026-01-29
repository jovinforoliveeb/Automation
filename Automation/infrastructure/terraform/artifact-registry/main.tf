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

resource "google_artifact_registry_repository" "ml_repo" {
  location      = var.region
  repository_id = var.repository_id
  description   = var.description
  format        = "DOCKER"
}
