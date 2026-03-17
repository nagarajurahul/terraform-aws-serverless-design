output "iam_role_arns" {
  value = {
    for k, v in module.iam :
    k => v.iam_role_arn
  }
  description = "ARNs of the IAM roles"
}

output "dynamodb_table_arn" {
  value       = module.dynamodb.dynamodb_table_arn
  description = "ARN of the DynamoDB Table"
}

output "lambda_arns" {
  value = {
    for k, v in module.lambda :
    k => v.lambda_arn
  }
  description = "ARNs of the Lambda functions"
}

output "api_gateway_rest_api_arn" {
  value       = module.api-gateway.api_gateway_rest_api_arn
  description = "ARN of the API Gateway REST API"
}

output "api_gateway_stage_url" {
  value       = module.api-gateway.api_gateway_stage_url
  description = "Invole URL of the API Gateway Stage"
}

output "event_bus_arn" {
  value       = module.eventbridge.event_bus_arn
  description = "ARN of the Event Bus"
}

output "event_rule_arn" {
  value       = module.eventbridge.event_rule_arn
  description = "ARN of the Event Rule"
}

output "event_target_arn" {
  value       = module.eventbridge.event_target_arn
  description = "ARN of the Event Target"
}

output "log_group_arn" {
  value       = module.cloudwatch.log_group_arn
  description = "ARN of the CloudWatch Log Group created"
}

output "log_delivery_destination_arn" {
  value       = module.cloudwatch.log_delivery_destination_arn
  description = "ARN of the CloudWatch Log Delivery Destination"
}

output "log_delivery_source_arn" {
  value       = module.cloudwatch.log_delivery_source_arn
  description = "ARN of the CloudWatch Log Delivery Source"
}

output "log_delivery_arn" {
  value       = module.cloudwatch.log_delivery_arn
  description = "ARN of the CloudWatch Log Delivery"
}