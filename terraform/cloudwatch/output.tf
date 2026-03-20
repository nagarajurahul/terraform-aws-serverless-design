output "log_group_arn" {
  value       = aws_cloudwatch_log_group.log_group.arn
  description = "ARN of the CloudWatch Log Group created"
}

output "log_delivery_destination_arn" {
  value       = aws_cloudwatch_log_delivery_destination.log_delivery_destination.arn
  description = "ARN of the CloudWatch Log Delivery Destination"
}

output "log_delivery_source_arn" {
  value       = aws_cloudwatch_log_delivery_source.log_delivery_source.arn
  description = "ARN of the CloudWatch Log Delivery Source"
}

output "log_delivery_arn" {
  value       = aws_cloudwatch_log_delivery.log_delivery.arn
  description = "ARN of the CloudWatch Log Delivery"
}