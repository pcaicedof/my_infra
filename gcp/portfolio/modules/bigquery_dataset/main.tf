variable "dataset_name" {
  type        = string
}

variable email_service_account {
  type        = string
}


resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset_name
  friendly_name               = var.dataset_name
  description                 = var.dataset_name
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = var.email_service_account
  }
}
