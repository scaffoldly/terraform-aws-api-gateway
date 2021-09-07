output "api_gateway_stages" {
  value = {
    for domain in module.domain :
    domain.stage => {
      stage_domain       = domain.domain
      api_gateway_domain = domain.api_gateway_domain
      zone_id            = domain.zone_id
    }
  }
  description = "A map of API Gateway stages, keyed by stage"
}
