resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  description   = var.lambda_function_description
  role          = var.lambda_iam_role_arn

  handler = "index.handler"

  runtime = var.lambda_runtime

  s3_bucket = var.lambda_s3_bucket
  s3_key    = var.lambda_s3_key

  environment {
    variables = {
      ENVIRONMENT = "production"
      LOG_LEVEL   = "info"
    }
  }
}