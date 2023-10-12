module "ecs" {
  source = "../../resource_module/ecs"
  ecs_cluster_name  = "POC-Cluster"
  cpu = 256
  memory = 512
  task_definition_name = "service"
  image_uri = "nginxdemos/hello"
  containerPort = 80
  hostPort = 80
}

module "ecr" {
  source = "../../resource_module/ecr"
  ecr_repository_name =  "poc-repo"
  image_tag_mutability  = "MUTABLE"
}