data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-tf-remote-state-bucket"
    key    = "ap-south-1/core-module/vpc/vpc-terraform.tfstate"
    region = "ap-south-1"
  }
}