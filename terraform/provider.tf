provider "google" {
  credentials = file("./credentials/service-account.json")

  project = "satofumi-dev"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

provider "google-beta" {
  credentials = file("./credentials/service-account.json")

  project = "satofumi-dev"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}