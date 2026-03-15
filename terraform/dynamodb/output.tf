output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.dynamodb_table.arn
  description = "ARN of the DynamoDB Table"
}