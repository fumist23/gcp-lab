resource "google_artifact_registry_repository" "public" {
  provider = google-beta

  repository_id = "public"
  format        = "DOCKER"
  location      = "asia-northeast1"
}

resource "google_artifact_registry_repository_iam_member" "public" {
    provider = google-beta

    location = google_artifact_registry_repository.public.location
    repository = google_artifact_registry_repository.public.repository_id
    role = "roles/viewer"
    member = "allUsers"
}