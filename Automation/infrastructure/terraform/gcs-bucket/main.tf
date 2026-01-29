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

resource "google_storage_bucket" "ml_bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
