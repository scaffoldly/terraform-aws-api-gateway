output "api_gateway_stages" {
  value = {
    for domain in module.domain :
    domain.stage => {
      api_gateway_domain = domain.api_gateway_domain
    }
  }
  description = "A map of API Gateway stages, keyed by stage"
}
