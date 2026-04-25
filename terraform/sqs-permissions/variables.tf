variable "sqs_queue_id" {
  description = ""
  type        = string
}

variable "sqs_queue_arn" {
  description = ""
  type        = string
}

variable "source_arns" {
  description = ""
  type        = map(list(string))
}