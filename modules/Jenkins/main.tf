resource "google_compute_instance" "jenkins_master" {
  name         = "jenkins-master"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 50
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet

    access_config {} # public IP
  }

  metadata_startup_script = file("${path.module}/startup-scripts/master.sh")

  tags = ["jenkins", "jenkins-master"]
}

####agent###

resource "google_compute_instance" "jenkins_agent" {
  name         = "jenkins-agent-1"
  machine_type = "e2-small"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 30
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet

    access_config {} # optional
  }

  metadata_startup_script = file("${path.module}/startup-scripts/agent.sh")

  tags = ["jenkins", "jenkins-agent"]
}
