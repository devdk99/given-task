module "sg" {
  source = "../../resource_module/sg"
  infra_env         = "staging"
  vpc_id    = data.terraform_remote_state.vpc.outputs.vpc_id
  sg_description = "stage security group"
}