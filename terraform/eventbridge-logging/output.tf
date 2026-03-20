output "log_resource_policy_arn" {
  value       = aws_cloudwatch_log_resource_policy.log_resource_policy.resource_arn
  description = "ARN of the CloudWatch Log Resource Policy"
}