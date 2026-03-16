output "lambda_arn" {
  value       = aws_lambda_function.lambda.arn
  description = "ARN of the Lambda function"
}