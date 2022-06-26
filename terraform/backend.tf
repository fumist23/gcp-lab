terraform {
  backend "gcs" {
    bucket = "satofumi-dev-terraform"
    prefix = "tfstate"
  }
}
