resource "google_storage_bucket" "terraform" {
    name = "satofumi-dev-terraform"
    location = "ASIA-NORTHEAST1"
    force_destroy = true
}