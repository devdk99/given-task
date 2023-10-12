output "vpc_id" {
  value = module.vpc.vpc_id
}

# output "vpc_public_subnets" {
#   # Result is a map of subnet id to cidr block, e.g.
#   # { "subnet_1234" => "10.0.1.0/4", ...}
#   value = [for subnet in aws_subnet.public : subnet.id ]
# }
 
output "vpc_public_subnets" {
  value = module.vpc.vpc_public_subnets_id
}

output "vpc_private_subnets" {
  value = module.vpc.vpc_private_subnets_id
}