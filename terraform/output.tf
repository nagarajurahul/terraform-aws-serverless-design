output "iam_role_arn" {
  value       = module.iam.iam_role_arn
  description = "ARN of the IAM role"
}

output "dynamodb_table_arn" {
  value       = module.dynamodb.dynamodb_table_arn
  description = "ARN of the DynamoDB Table"
}

output "lambda_arn" {
  value       = module.lambda.lambda_arn
  description = "ARN of the Lambda function"
}

output "api_gateway_rest_api_arn" {
  value       = module.api-gateway.api_gateway_rest_api_arn
  description = "ARN of the API Gateway REST API"
}