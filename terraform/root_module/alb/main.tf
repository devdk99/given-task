# locals {
#   security_group = data.terraform_remote_state.sg.outputs.vpc_public_subnets_id
# }

# locals {
#   subnets = data.terraform_remote_state.sg.outputs.vpc_public_subnet
# }

# output "print_sg" {
#   value = [for security_groups, id in data.terraform_remote_state.sg.outputs.aws_security_group : id]
# }

# output "print_subnet" {
#   value = [for subnet, id in data.terraform_remote_state.vpc.outputs.vpc_public_subnets : id]
# }


module "alb" {
  source                     = "../../resource_module/alb"
  infra_env                  = "staging"
  alb_name                   = "staging-lb"
  lb_target_name             = "POC"
  security_groups            = [for security_groups, id in data.terraform_remote_state.sg.outputs.aws_security_group : id]
  subnets                    = [for subnet, id in data.terraform_remote_state.vpc.outputs.vpc_public_subnets : id]
  vpc_id                     = data.terraform_remote_state.vpc.outputs.vpc_id
  load_balancer_type         = "application"
  host_header                = ["abc.dev.com"]
  certificate_arn            = data.terraform_remote_state.acm.outputs.ca_arn
  ssl_policy                 = "ELBSecurityPolicy-2016-08"
  enable_deletion_protection = false
}