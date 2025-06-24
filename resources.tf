resource "google_compute_network" "auto-vpc-tf-unique-name" {
  name                    = "auto-vpc-tf-unique-name"
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom-vpc-tf-unique" {
  name                    = "custom-vpc-tf-unique"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-custom-vpc-tf" {
  name    = "subnet-custom-vpc-tfv"
  region  = "asia-southeast1"
  network = google_compute_network.custom-vpc-tf-unique.id
  ip_cidr_range = "10.1.0.0/24"
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow-icmp" {
    name = "allow-icmp-sandeep"
    network = google_compute_network.custom-vpc-tf-unique.id
    direction = "INGRESS"
    priority = 1000
    source_ranges = ["14.97.94.230/32"]
    allow {
        protocol = "icmp"
    }

}

resource "google_storage_bucket" "your-bucket-name-sandeep" {
  name          = "your-bucket-name-sandeep"
  location      = "US"
  force_destroy = true
  storage_class = "NEARLINE"
  labels = {
    "dep" = "compliance"
  }

  lifecycle_rule {
    condition {
      age = 6
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
        age = 3
    }
    action {
        type = "SetStorageClass"
        storage_class = "COLDLINE"
    }
  }

  lifecycle_rule {
    condition {
      age = 2
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_storage_bucket_object" "object-sandeep" {
    name = "iphone_logo"
    bucket = google_storage_bucket.your-bucket-name-sandeep.name
    source = "p2.jpg"
}