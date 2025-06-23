provider "google" {
  credentials = file("key.json")
  project     = "sunlit-cab-463104-m6"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-a"
}