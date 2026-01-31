terraform {
  backend "gcs" {
    bucket = "cloud-kitchen-tf-state"
    prefix = "dev"
  }
}
