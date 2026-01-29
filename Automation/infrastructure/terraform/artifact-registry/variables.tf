variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region for Artifact Registry"
  type        = string
  default     = "us-central1"
}

variable "repository_id" {
  description = "Artifact Registry repository name"
  type        = string
}

variable "description" {
  description = "Description of the repository"
  type        = string
  default     = "Docker images for Vertex AI custom training jobs"
}
