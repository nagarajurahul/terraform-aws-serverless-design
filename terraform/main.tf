module "iam" {
  source = "./iam"

  iam_role_name = var.iam_role_name
  iam_principal = var.iam_principal
  iam_policies  = var.iam_policies
}

module "dynamodb" {
  source = "./dynamodb"

  dynamodb_table_name               = var.dynamodb_table_name
  dynamodb_table_hash_key           = var.dynamodb_table_hash_key
  dynamodb_table_attributes         = var.dynamodb_table_attributes
  global_secondary_index_name       = var.global_secondary_index_name
  global_secondary_index_attributes = var.global_secondary_index_attributes
}

module "lambda" {
  source = "./lambda"

  lambda_function_name        = var.lambda_function_name
  lambda_function_description = var.lambda_function_description
  lambda_iam_role_arn         = var.lambda_iam_role_arn
  lambda_runtime              = var.lambda_runtime
  lambda_s3_bucket            = var.lambda_s3_bucket
  lambda_s3_key               = var.lambda_s3_key
}