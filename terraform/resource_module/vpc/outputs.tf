output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "ip_rang" {
    value = var.vpc_cidr
}

output "default_region" {
  value = var.region
}
 
output "vpc_public_subnets_id" {
  value = [for subnet in aws_subnet.public : subnet.id ]
}
 
output "vpc_private_subnets_id" {
  value = [for subnet in aws_subnet.private : subnet.id ]
}