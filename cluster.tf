resource "google_service_account" "kubernetes2" {
  account_id   = "kubernetes2"
  display_name = "Service Account"
}

resource "google_container_cluster" "primary" {
  name     = var.cluster
  location = var.region
  node_locations = [ "europe-north1-a" , "europe-north1-b"]
  remove_default_node_pool = true
  initial_node_count       = 1
  network = google_compute_network.vpc_network.self_link
  subnetwork = google_compute_subnetwork.test-subnet.self_link
  networking_mode = "VPC_NATIVE"
  
  ip_allocation_policy {
    cluster_secondary_range_name = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes = true
    master_ipv4_cidr_block = "172.16.0.0/28"

  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "95.173.231.216/32"
      display_name = "home"
    }
  }


  }
