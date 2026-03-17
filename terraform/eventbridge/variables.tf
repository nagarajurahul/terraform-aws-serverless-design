variable "event_rule_name" {
  description = ""
  type        = string
}

variable "event_rule_description" {
  description = ""
  type        = string
}

variable "event_pattern" {
  description = ""
  type        = any
}

variable "target_id" {
  description = ""
  type        = string
}

variable "event_target_arn" {
  description = ""
  type        = string
}

variable "lambda_function_name" {
  description = ""
  type        = string
}

variable "event_bus_name" {
  description = ""
  type        = string
}

variable "event_bus_description" {
  description = ""
  type        = string
}