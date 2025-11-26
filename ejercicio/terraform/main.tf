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

# resource "google_storage_bucket" "webapp_bucket" { COMPLETAR }

# resource "google_container_cluster" "primary" { COMPLETAR }
