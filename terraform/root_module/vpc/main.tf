module "vpc" {
  source            = "../../resource_module/vpc"
  vpc_cidr        = "10.0.0.0/16"
  dns_hostname      = true
  dns_support       = true
  infra_env         = "staging"
  
  tags = {
    "Name" = "VPC-DEV"
  }
}
