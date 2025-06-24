output "auto_vpc_name" {
  value = google_compute_network.auto-vpc-tf-unique-name.id
}

output "custom_vpc_name" {
  value = google_compute_network.custom-vpc-tf-unique.id
}