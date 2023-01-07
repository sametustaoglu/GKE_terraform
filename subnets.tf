resource "google_compute_subnetwork" "test-subnet" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.10.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.11.0.0/16"
  }

   secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.12.0.0/16"
  }
}