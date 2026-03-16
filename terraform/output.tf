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