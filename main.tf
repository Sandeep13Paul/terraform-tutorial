provider "google" {
  credentials = var.google_creds
  project     = "sunlit-cab-463104-m6"
  region      = "us-central1"
  zone        = "us-central1-a"
}

variable "google_creds" {
  description = "GCP credentials JSON"
  type        = string
}