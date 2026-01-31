module "vpc" {
  source   = "../../modules/vpc"
  vpc_name = "cloud-vpc"
  region   = var.region
}

#####Jenkins Machine#####
module "jenkins" {
  source     = "../../modules/jenkins"
  project_id = var.project_id
  region     = var.region
  zone       = "us-central1-a"

  network = module.vpc.vpc_id
  subnet  = module.vpc.private_subnet
}

##### cluster

module "gke" {
  source = "../../modules/gke"

  project_id   = var.project_id
  region       = var.region
  cluster_name = "ck-dev-gke"

  network    = module.vpc.vpc_id
  subnetwork = module.vpc.private_subnet
}
