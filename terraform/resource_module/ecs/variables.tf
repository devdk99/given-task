variable "ecs_cluster_name" {
  type = string
  default = ""
}

variable "memory" {
  type = number
  default = 512
}

variable "cpu" {
  type = number
  default = 10
}

variable "containerPort" {
  type = number
  default = 80
}

variable "hostPort" {
  type = number
  default = 80
}

variable "task_definition_name" {
  type = string
  default = ""
}

variable "image_uri" {
  type = string
  default = ""
}

variable "attributeroot_directory" {
  type = string
  default = ""
}

variable "desired_count" {
  type = number
}

variable "security_groups" {
  type = list(string)
  default = [ "" ]
}

variable "subnets" {
  type = list(string)
  default = [ "" ]
}

variable "target_group_arn" {
  type = string
  default = ""
}
