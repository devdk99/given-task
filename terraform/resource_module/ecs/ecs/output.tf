output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.service.arn
}

output "ecs_task_definition_revision" {
  value = aws_ecs_task_definition.service.revision
}

output "aws_ecs_cluster_arn" {
  value = aws_ecs_cluster.main.arn
}

output "aws_ecs_cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "aws_ecs_service_name" {
  value = aws_ecs_service.main.name
}

output "aws_ecs_service_id" {
  value = aws_ecs_service.main.id
}