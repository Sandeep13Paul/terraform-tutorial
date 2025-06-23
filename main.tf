provider "google" {
  credentials = file("${path.module}/creds.json")
  project     = "sunlit-cab-463104-m6"
  region      = "us-central1"
  zone        = "us-central1-a"
}