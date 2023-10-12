data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "dev-tf-remote-state-bucket"
    key    = "ap-south-1/core-module/sg/sg-terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-tf-remote-state-bucket"
    key    = "ap-south-1/core-module/vpc/vpc-terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "acm" {
  backend = "s3"
  config = {
    bucket = "dev-tf-remote-state-bucket"
    key    = "ap-south-1/core-module/route53/acm-terraform.tfstate"
    region = "ap-south-1"
  }
}