module "dynamodb" {
  source = "./dynamodb"

  dynamodb_table_name               = var.dynamodb_table_name
  dynamodb_table_hash_key           = var.dynamodb_table_hash_key
  dynamodb_table_attributes         = var.dynamodb_table_attributes
  global_secondary_index_name       = var.global_secondary_index_name
  global_secondary_index_attributes = var.global_secondary_index_attributes
}

locals {

  create_order_policies = {

    dynamodb_policy = {
      statements = [{
        effect    = "Allow"
        actions   = ["dynamodb:PutItem"]
        resources = [module.dynamodb.dynamodb_table_arn]
      }]
    }

  }

}

module "iam" {
  # Here, I dont need to mention depends_on specifically on dynamodb
  # Because, Meanwhile dynamodb is getting created, other components such as role and assume role policy will be created first
  # When dynamodb gets ready with ARN, policy will be created from locals
  source = "./iam"

  iam_role_name = var.iam_role_name
  iam_principal = var.iam_principal
  iam_policies  = local.create_order_policies
}

module "lambda" {
  # Here, we might need depends_on
  # Cause, we dont want lambda to be invoked, unless policies are attached to role
  # Meaning, lambda will have enough permissions when invoked
  source     = "./lambda"
  depends_on = [module.iam]

  lambda_function_name        = var.lambda_function_name
  lambda_function_description = var.lambda_function_description
  lambda_iam_role_arn         = module.iam.iam_role_arn
  lambda_handler              = var.lambda_handler
  lambda_runtime              = var.lambda_runtime
  lambda_s3_bucket            = var.lambda_s3_bucket
  lambda_s3_key               = var.lambda_s3_key
}

module "api-gateway" {
  source = "./api-gateway"

  rest_api_name        = "test-api"
  rest_api_description = "Test API Description"
  resource             = "orders2"
  http_method          = "POST"
  authorization        = "NONE"
  lambda_invoke_arn    = module.lambda.lambda_invoke_arn
  lambda_function_name = module.lambda.lambda_function_name
  stage_name           = "dev"
}