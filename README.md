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

## Providers

## Modules

## Resources

## Inputs

## Outputs

<!-- END_TF_DOCS -->
