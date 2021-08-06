variable "subdomain" {
  type        = string
  description = "The subdomain for API Gateway, which will be programmatically appended with the domain, and (optionally) prepended with subdomain_suffix"
}

variable "stages" {
  type = map(
    object({
      domain           = string
      subdomain_suffix = optional(string)
    })
  )
  description = "Stage configuration, keyed by stage name"
}
