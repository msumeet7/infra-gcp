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
