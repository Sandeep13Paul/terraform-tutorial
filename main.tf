provider "google" {
  credentials = var.google_creds
  project     = "sunlit-cab-463104-m6"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-a"
}