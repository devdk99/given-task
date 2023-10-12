resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster_name  

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "service" {
  family = "service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  # container_definitions = file("task-definitions/service.json")
  container_definitions = jsonencode([
    {
      name      = var.task_definition_name
      image     = var.image_uri
      cpu       = var.cpu
      memory    = var.memory
      essential = true
      portMappings = [
        {
          containerPort = var.containerPort
          hostPort      = var.hostPort
        }
      ]
    }
  ])

  # volume {
  #   name = "service-storage"

  #   efs_volume_configuration {
  #     file_system_id          = aws_efs_file_system.fs.id
  #     root_directory          = var.root_directory
  #     # transit_encryption      = "ENABLED"
  #     # transit_encryption_port = 2999
  #     # authorization_config {
  #     #   access_point_id = aws_efs_access_point.test.id
  #     #   iam             = "ENABLED"
  #     # }
  #   }
  # }
}

resource "aws_ecs_service" "main" {
  name            = var.task_definition_name
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = var.desired_count

  network_configuration {
    security_groups = var.security_groups #[for security_groups, id in data.terraform_remote_state.sg.outputs.aws_security_group : id]
    subnets         = var.subnets #[for subnet, id in data.terraform_remote_state.vpc.outputs.vpc_public_subnets : id]
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.task_definition_name
    container_port   = var.containerPort
  }
}

