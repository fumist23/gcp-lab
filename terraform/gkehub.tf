resource "google_gke_hub_feature" "config_cluster" {
  name = "multiclusteringress"
  location = "global"
  spec {
    multiclusteringress {
      config_membership = google_gke_hub_membership.config.id
    }
  }
  provider = google-beta
}
