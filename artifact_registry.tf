resource "google_artifact_registry_repository" "my-repo2" {
  location      = "us-central1"
  repository_id = "test-repo2"
  description   = "example docker repository"
  format        = "DOCKER"
}