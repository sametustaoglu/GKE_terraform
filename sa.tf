resource "google_project_iam_member" "firestore_owner_binding" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.kubernetes2.email}"
}