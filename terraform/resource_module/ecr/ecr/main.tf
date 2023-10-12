resource "aws_ecr_repository" "main" {
  name                 = var.ecr_repository_name
  image_tag_mutability = var.image_tag_mutability #"MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}