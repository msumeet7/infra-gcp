output "vpc_id" {
  value = google_compute_network.this.id
}

output "public_subnet" {
  value = google_compute_subnetwork.public.id
}

output "private_subnet" {
  value = google_compute_subnetwork.private.id
}

output "db_subnet" {
  value = google_compute_subnetwork.db.id
}
