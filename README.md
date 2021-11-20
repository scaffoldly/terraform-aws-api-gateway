[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-aws-api-gateway)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

## Description

Configure API Gateway for multiple stages and CloudWatch logging permissions

## Usage

```hcl
module "aws_api_gateway" {
  source = "scaffoldly/aws/api-gateway"

  stage_domains = module.dns.stage_domains

  providers = {
    aws.dns = aws.root
  }

  depends_on = [
    module.dns
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 1.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.53.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_domain"></a> [domain](#module\_domain) | scaffoldly/api-gateway-domain/aws | 1.0.12 |

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_account.account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_account) | resource |
| [aws_iam_role.api_gateway_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.api_gateway_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_stages"></a> [stages](#input\_stages) | Stage configuration, keyed by stage name | <pre>map(<br>    object({<br>      domain           = string<br>      subdomain_suffix = optional(string)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_subdomain"></a> [subdomain](#input\_subdomain) | The subdomain for API Gateway, which will be programmatically appended with the domain, and (optionally) prepended with subdomain\_suffix | `string` | n/a | yes |
| <a name="input_websockets"></a> [websockets](#input\_websockets) | Enable websockets for each API | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gateway_stages"></a> [api\_gateway\_stages](#output\_api\_gateway\_stages) | A map of API Gateway stages, keyed by stage |
<!-- END_TF_DOCS -->
