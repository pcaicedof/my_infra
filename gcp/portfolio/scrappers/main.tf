data "terraform_remote_state" "scraper-remote-state" {
  backend = "gcs"
  config = {
    bucket  = "portfolio-terraform-states"
    prefix  = "terraform/state/scrappers"
  }
}

resource "google_service_account" "pcf_sa" {
  account_id = "pcf-sa"
}

resource "google_storage_bucket" "cloud_functions_code" {
    name = "${var.project}-cloud-functions-code"
    location = "US"
}

module instance_dataset {
  source = "../modules/bigquery_dataset"
  dataset_name = "instances"
  email_service_account = google_service_account.pcf_sa.email
}

resource "google_storage_bucket" "prueba_bucket" {
    name = "${var.project}-prueba"
    location = "US"
}