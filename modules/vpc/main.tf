resource "google_compute_network" "this" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  name          = "public-subnet"
  region        = var.region
  network       = google_compute_network.this.id
  ip_cidr_range = "10.10.1.0/24"
}

resource "google_compute_subnetwork" "private" {
  name          = "private-subnet"
  region        = var.region
  network       = google_compute_network.this.id
  ip_cidr_range = "10.10.2.0/24"
}

resource "google_compute_subnetwork" "db" {
  name          = "db-subnet"
  region        = var.region
  network       = google_compute_network.this.id
  ip_cidr_range = "10.10.3.0/24"
}