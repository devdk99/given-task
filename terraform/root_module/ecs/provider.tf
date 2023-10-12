# AWS Provider
terraform {
  required_providers {
    aws = {
      version = "4.26.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
}