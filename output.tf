output "api_gateway_stages" {
  value = {
    for domain in module.domain :
    domain.stage => {
      stage_domain                 = domain.domain
      api_gateway_domain           = domain.api_gateway_domain
      api_gateway_websocket        = domain.api_gateway_websocket
      api_gateway_websocket_domain = domain.api_gateway_websocket_domain
      subdomain                    = domain.subdomain
      subdomain_suffix             = domain.subdomain_suffix
      zone_id                      = domain.zone_id
    }
  }
  description = "A map of API Gateway stages, keyed by stage"
}
