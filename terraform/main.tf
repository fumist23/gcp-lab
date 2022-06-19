terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.25.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.25.0"
    }
  }

  backend "gcs" {
    bucket = "satofumi-dev-terraform"
    prefix = "tfstate"
  }
}