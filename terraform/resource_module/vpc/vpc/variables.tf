# variable "cidr_block" {
#   type        = string
#   default     = ""
#   description = "This IP address rang is for Terraform Project"
# }

# variable "region" {
#   type        = map(string)
#   default     = {}
#   description = "this region is for terraform project"
# }

variable "dns_hostname" {
  type = bool
  default = true
}

variable "dns_support" {
  type = bool
  default = true
}

variable "enable_classiclink" {
  type = bool
  default = true
}

variable "tags" {
  description = "Default tags to VPC"
  type = map(string)
  default = {}
}

variable "region" {
  type = string
  default = ""
  description = "this region is for terraform project"
}

variable "public_subnet_numbers" {
  type = map(number)
 
  description = "Map of AZ to a number that should be used for public subnets"
 
  default = {
    "ap-south-1a" = 1
    "ap-south-1b" = 2
    "ap-south-1c" = 3
  }
}
 
variable "private_subnet_numbers" {
  type = map(number)
 
  description = "Map of AZ to a number that should be used for private subnets"
 
  default = {
    "ap-south-1a" = 4
    "ap-south-1b" = 5
    "ap-south-1c" = 6
  }
}
 
variable "vpc_cidr" {
  type        = string
  description = "The IP range to use for the VPC"
  default     = "10.0.0.0/16"
}
 
variable "infra_env" {
  type        = string
  description = "infrastructure environment"
}