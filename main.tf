provider "google" {
  credentials = base64decode(var.GOOGLE_CREDENTIALS)
  project     = "sunlit-cab-463104-m6"
  region      = "us-central1"
  zone        = "us-central1-a"
}