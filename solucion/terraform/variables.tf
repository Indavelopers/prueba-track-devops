variable "project_id" {
  description = "The GCP project ID where resources will be deployed."
  type        = string
}

variable "bucket_name" {
  description = "The name for the new GCS bucket. Must be globally unique."
  type        = string
}

variable "cluster_name" {
  description = "The name for the GKE cluster."
  type        = string
}

variable "location" {
  description = "The location/region for the resources."
  type        = string
}
