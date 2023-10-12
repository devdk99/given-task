terraform {
  backend "s3" {
    bucket         = "dev-tf-remote-state-bucket"
    key            = "ap-south-1/core-module/vpc/vpc-terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dev-tf-remote-state-table-lock"
  }
}