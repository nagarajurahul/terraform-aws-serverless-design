variable "event_bus_name" {
  description = ""
  type        = string
}

variable "event_bus_description" {
  description = ""
  type        = string
}

variable "event_rules" {
  type = map(object({
    event_rule_description = optional(string)
    state                  = optional(string, "ENABLED")
    event_pattern          = any

    targets = map(object({
      target_arn = string
      target_id  = string
    }))
  }))
}