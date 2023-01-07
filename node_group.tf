resource "google_container_node_pool" "np" {
  name       = "my-node-pool"
  cluster    = var.cluster
  location = var.region
  max_pods_per_node = 30
  node_locations = [ "europe-north1-a" , "europe-north1-b"]
  node_count = 1
  autoscaling {
    total_min_node_count = 1
    total_max_node_count = 10
  }

  node_config {
    machine_type = "e2-medium"
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.kubernetes2.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  
}