output "api_gateway_rest_api_arn" {
  value       = aws_api_gateway_rest_api.REST_API.arn
  description = "ARN of the API Gateway REST API"
}