variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "project_number" {
  description = "GCP Project Number"
  type        = string
}

variable "bucket_name" {
  description = "GCS bucket used by Vertex AI"
  type        = string
}

variable "artifact_repo" {
  description = "Artifact Registry repository name"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}
