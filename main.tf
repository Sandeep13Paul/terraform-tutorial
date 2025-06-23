provider "google" {
  credentials = file("/home/atlantis/.atlantis/repos/Sandeep13Paul/terraform-tutorial/21/default/decoded.json")
  project     = "sunlit-cab-463104-m6"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-a"
}