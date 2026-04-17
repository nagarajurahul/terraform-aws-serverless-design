variable "key_description" {
  type        = string
  description = ""
}

variable "key_usage" {
  type        = string
  description = ""
}

variable "customer_master_key_spec" {
  type        = string
  description = ""
}

variable "rotation_period_in_days" {
  type        = number
  description = ""
}

variable "deletion_window_in_days" {
  type        = number
  description = ""
}
