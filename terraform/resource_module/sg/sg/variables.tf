# variable "sg_name" {
#   type = status_code
#   default = ""
# }

variable "infra_env" {
  type        = string
  description = "infrastructure environment"
  default     = ""
}

variable "sg_description" {
  type    = string
  default = ""
}

# variable "sg_config" {
#   type = list(object({
#     from_port = number
#     to_port   = number
#     protocol  = string
#   }))
#   default = [
#     {
#       from_port = 80
#       to_port   = 80
#       protocol  = "tcp"
#     }
#   ]
# }

# variable "allow_tls" {
#   type = set(string)
#   default = [ "80", "443" ]
# }

# variable "allow_rds" {
#   type = set(string)
#   default = [ "80", "443" ]
# }

variable "sg_name" {
  type = set(string)

  description = "Map of AZ to a number that should be used for public subnets"

  default = [
    "app_sg",
    "rds_sg",
    "efs_sg",
    "redis_sg"
  ]
}

variable "vpc_id" {
  type = string
  default = ""
}

variable "tags" {
  description = "Default tags to VPC"
  type        = map(string)
  default     = {}
}

variable "ipv4_range" {
  type    = list(any)
  default = []
}

variable "ipv6_range" {
  type    = list(any)
  default = []
}