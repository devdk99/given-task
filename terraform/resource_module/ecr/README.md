# The `ECR` module.

This module will allow us to create new `ECR`.


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
| aws_ecr_repository | resource |



## Inputs
| Name | Description | Type | Default Value |
| ---------- | --------- | ---------- | ---------- |
| ecr_repository_name | Name of the Repository | `string` | Empty |
| image_tag_mutability | type of tag mutability | `string` | Empty |



## Outputs

| Name | Description |
| ---------- | --------- |
| ecr_arn | ARN of ECR repository |
| ecr_registry_id | ID of ECR repository |
| repository_url | URL of ECR repository |

