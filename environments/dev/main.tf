module "vpc" {
  source   = "../../modules/vpc"
  vpc_name = "cloud-vpc"
  region   = var.region
}
