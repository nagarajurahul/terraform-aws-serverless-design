variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "delay_seconds" {
  description = "Delay in seconds for message delivery"
  type        = number
  default     = 0
}

variable "visibility_timeout_seconds" {
  description = "Time (in seconds) a message remains invisible to other consumers after being received; should exceed the processing time to prevent duplicate processing."
  type        = number
  default     = 30
}

variable "max_message_size" {
  description = "Maximum message size in bytes"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "Message retention period in seconds"
  type        = number
  default     = 86400
}

variable "receive_wait_time_seconds" {
  description = "Long polling wait time in seconds"
  type        = number
  default     = 10
}

variable "kms_arn" {
  description = "KMS ARN to encrypt the SQS Queue"
  type        = string
}
