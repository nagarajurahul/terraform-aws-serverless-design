variable "dynamodb_table_name" {
  description = ""
  type        = string
}

variable "dynamodb_table_hash_key" {
  description = ""
  type        = string
}

variable "dynamodb_table_attributes" {
  description = ""
  type        = map(string)
}

variable "global_secondary_index_name" {
  description = ""
  type        = string
}

variable "global_secondary_index_attributes" {
  description = ""
  type        = map(string)
}