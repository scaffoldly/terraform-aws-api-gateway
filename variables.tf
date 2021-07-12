variable "stage_domains" {
  type = map(
    object({
      domain                = string
      subdomain             = string
      subdomain_suffix      = string
      serverless_api_domain = string
      platform_domains      = map(string)
      certificate_arn       = string
      dns_provider          = string
      dns_domain_id         = string
      stage_env_vars        = map(string)
    })
  )
  description = "The stage domain config (the output from the terraform-aws-dns module)"
}
