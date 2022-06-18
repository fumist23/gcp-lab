terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.25.0"
    }
  }

  backend "gcs"{
    credentials = "./credentials/service-account.json"

    bucket = "satofumi-dev-terraform"
    prefix = "tfstate"
  }
}