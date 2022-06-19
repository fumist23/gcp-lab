resource "google_artifact_registry_repository" "public" {
    repository_id = "public"
    format = "DOCKER"
    location = "asia-northeast1"
}