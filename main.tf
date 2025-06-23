provider "google" {
  credentials = file("/home/atlantis/.atlantis/repos/Sandeep13Paul/terraform-tutorial/21/default/decoded.json")
  project     = "sunlit-cab-463104-m6"
  region      = "us-central1"
  zone        = "us-central1-a"
}