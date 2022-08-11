provider "google"{
    project = "pcf-portfolio"
    region  = "us-central1"
    zone    = "us-central1-c"
}

terraform {
    required_version = ">= 1.0.11"
    backend "gcs" {
      bucket = "portfolio-terraform-states"
      prefix = "terraform/state/scrappers"
    }  
}