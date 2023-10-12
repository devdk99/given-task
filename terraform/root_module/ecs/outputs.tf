output "ecs_task_definition_arn" {
  value = module.ecs.ecs_task_definition_arn
}

output "ecs_task_definition_revision" {
  value = module.ecs.ecs_task_definition_revision
}

output "aws_ecs_cluster_arn" {
  value = module.ecs.aws_ecs_cluster_arn
}

output "aws_ecs_cluster_id" {
    value = module.ecs.aws_ecs_cluster_id
}

output "ecr_arn" {
  value = module.ecr.ecr_arn
}

output "ecr_registry_id" {
  value = module.ecr.ecr_registry_id
}

output "repository_url" {
  value = module.ecr.repository_url
}