terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.12.0"
    }
  }
}

provider "google" {
  project = var.project_id
}

resource "google_storage_bucket" "webapp_bucket" {
  name     = var.bucket_name
  location = var.location
  uniform_bucket_level_access = true
  force_destroy = true
}

resource "google_container_cluster" "primary" {
  project            = var.project_id
  name               = var.cluster_name
  location           = var.location
  initial_node_count = 1
  node_config {
    machine_type = "e2-standard-4"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  deletion_protection = false
}
