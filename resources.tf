resource "google_compute_network" "auto-vpc-tf" {
  name                    = "auto-vpc-tf"
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom-vpc-tf" {
  name                    = "custom-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-custom-vpc-tf" {
  name    = "subnet-custom-vpc-tfv"
  region  = "asia-southeast1"
  network = google_compute_network.custom-vpc-tf.id
  ip_cidr_range = "10.1.0.0/24"
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow-icmp" {
    name = "allow-icmp-sandeep"
    network = google_compute_network.custom-vpc-tf.id
    direction = "INGRESS"
    priority = 1000
    source_ranges = ["14.97.94.230/32"]
    allow {
        protocol = "icmp"
    }

}

resource "google_storage_bucket" "auto-expire" {
  name          = "auto-expiring-bucket"
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
    bucket = google_storage_bucket.auto-expire.name
    source = "p2.jpg"
}