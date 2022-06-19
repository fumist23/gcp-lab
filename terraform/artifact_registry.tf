resource "google_artifact_registry_repository" "public" {
  provider = google-beta

  repository_id = "public"
  format        = "DOCKER"
  location      = "asia-northeast1"
}
