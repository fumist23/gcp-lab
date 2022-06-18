resource "google_service_account" "node_pool" {
  account_id   = "standard-cluster-node-pool"
  display_name = "standard-cluster-node-pool"
  description  = "service account for node pool in standard cluster."
}