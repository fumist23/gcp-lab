resource "google_container_cluster" "standard" {
  name     = "standard-cluster"
  location = "asia-northeast1-a" # zonal cluster
  #   addons_config    = {}

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  # vpc native networking mode (ref: https://cloud.google.com/kubernetes-engine/docs/concepts/alias-ips)
  networking_mode = "VPC_NATIVE"
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/14"
    services_ipv4_cidr_block = "/20"
  }

  network = google_compute_network.vpc_network.name

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  workload_identity_config {
    workload_pool = "satofumi-dev.svc.id.goog"
  }

  release_channel {
    channel = "STABLE"
  }
}

resource "google_container_node_pool" "standard" {
  name       = "standard-cluster-node-pool"
  cluster    = google_container_cluster.standard.id

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  node_config {
    preemptible     = true
    machine_type    = "e2-micro"
    service_account = google_service_account.node_pool.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_gke_hub_membership" "standard" {
  provider = google-beta
  membership_id = "standard"
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${google_container_cluster.standard.id}"
    }
  }

  authority {
    issuer = "https://container.googleapis.com/v1/${google_container_cluster.standard.id}"
  }
}
