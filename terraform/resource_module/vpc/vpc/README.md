# The `VPC` module.

This module will allow us to create new `VPC`.


## Requirements
| Name | Version |
| ---------- | --------- |
| terraform  | >=1.1.0   |

## Providers
| Name | Version |
| ---------- | --------- |
| aws        | >=4.26.0  |

## Resources

| Name | Type |
| ---------- | --------- |
| aws_vpc | resource |
| aws_internet_gateway | resource |
| aws_subnet | resource |
| aws_route_table | resource |
| aws_route_table_association | resource |


## Inputs
| Name | Description | Type | Default Value |
| ---------- | --------- | ---------- | ---------- |
| dns_hostname | Enable or disable DNS hostname | `bool` | true |
| dns_support | Enable of disable dns support | `bool` | true |
| enable_classiclink | Enable of disable classic link | `bool` | true |
| tags | resource tag | `map(string)` | {} |
| region  | region of vpc | `string` | Empty |
| public_subnet_numbers  | Create public subnet in each avaibility zone | `map(number)` | {"ap-south-1a", "ap-south-1b" = 2,   "ap-south-1c" = 3} |
| private_subnet_numbers  | Create public subnet in each avaibility zone | `map(number)` | {"ap-south-1a", "ap-south-1b" = 2,   "ap-south-1c" = 3} |
| vpc_cidr  | VPC IP range | `string` | 10.0.0.0/16 |
| infra_env  | environment tag | `string` | empty|


## Outputs

| Name | Description |
| ---------- | --------- |
| vpc_id | VPC ID. |
| ip_rang | Ip range |
| default_region | vpc region |
| vpc_public_subnets_id | list of public subnet |
| vpc_private_subnets_id | list of private subnet |
