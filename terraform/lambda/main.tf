resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  description   = var.lambda_function_description
  role          = var.lambda_iam_role_arn

  handler = var.lambda_handler

  runtime = var.lambda_runtime

  s3_bucket = var.lambda_s3_bucket
  s3_key    = var.lambda_s3_key

  environment {
    variables = merge(local.default_env, var.lambda_environment_variables)
  }
}