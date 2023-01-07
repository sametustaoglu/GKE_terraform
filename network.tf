resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = "test-network"
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode = "REGIONAL"
  delete_default_routes_on_create = false
}