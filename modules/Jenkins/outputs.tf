output "jenkins_master_name" {
  description = "Name of the Jenkins master VM"
  value       = google_compute_instance.jenkins_master.name
}

output "jenkins_master_public_ip" {
  description = "Public IP address of Jenkins master"
  value       = google_compute_instance.jenkins_master.network_interface[0].access_config[0].nat_ip
}

output "jenkins_master_private_ip" {
  description = "Private IP address of Jenkins master"
  value       = google_compute_instance.jenkins_master.network_interface[0].network_ip
}

output "jenkins_agent_name" {
  description = "Name of the Jenkins agent VM"
  value       = google_compute_instance.jenkins_agent.name
}

output "jenkins_agent_private_ip" {
  description = "Private IP address of Jenkins agent"
  value       = google_compute_instance.jenkins_agent.network_interface[0].network_ip
}
