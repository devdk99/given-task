# The `SG` module.

This module will allow us to create new `SG`.


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
| aws_security_group | resource |



## Inputs
| Name | Description | Type | Default Value |
| ---------- | --------- | ---------- | ---------- |
| sg_description | Security group description | `string` | Empty |
| sg_name | Name of security group | `string` | Empty |
| vpc_id | specify ID of VPC | `string` | Empty |
| tags | resource tag | `map(string)` | {} |
| infra_env  | environment tag | `string` | empty|


## Outputs

| Name | Description |
| ---------- | --------- |
| aws_security_group | List of Security group |
