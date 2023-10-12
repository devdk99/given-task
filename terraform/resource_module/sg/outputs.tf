output "aws_security_group" {
  value = [for security_group in aws_security_group.sg : security_group.id]
}