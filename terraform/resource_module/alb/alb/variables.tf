variable "alb_name" {
  type = string
  default = ""
}

variable "internal" {
  type = bool
  default = false
}

variable "load_balancer_type" {
  type = string
  default = ""
}

variable "enable_deletion_protection" {
  type = bool
  default = true
}

variable "certificate_arn" {
  type = string
  default = ""
}

variable "ssl_policy" {
  type = string
  default = ""
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "lb_target_name" {
  type = string
  default = ""
}

variable "target_port" {
  type = string
  default = ""
}

variable "lb_config" {
  type = list(object({
    port = number
    protocol = string
    target_type = string
    status_code = string
  }))
  default = [
    {
      port = 80
      protocol = "HTTPS"
      target_type = "ip"
      status_code = "HTTP_301"
    }
  ]
}

variable "host_header" {
  type = list(string)
  default = [""]
}

variable "infra_env" {
  type        = string
  description = "infrastructure environment"
}

variable "security_groups" {
  type = list(string)
  default = [""]
}

variable "subnets" {
  type = list(string)
  default = [""]
}

variable "vpc_id" {
  type = string
  default = ""
}