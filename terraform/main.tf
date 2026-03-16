module "dynamodb" {
  source = "./dynamodb"

  dynamodb_table_name               = var.dynamodb_table_name
  dynamodb_table_hash_key           = var.dynamodb_table_hash_key
  dynamodb_table_attributes         = var.dynamodb_table_attributes
  global_secondary_index_name       = var.global_secondary_index_name
  global_secondary_index_attributes = var.global_secondary_index_attributes
}

module "iam" {
  # Here, I dont need to mention depends_on specifically on dynamodb
  # Because, Meanwhile dynamodb is getting created, other components such as role and assume role policy will be created first
  # When dynamodb gets ready with ARN, policy will be created from locals
  source = "./iam"

  for_each = local.iam_roles

  iam_role_name = each.key
  iam_principal = each.value.principal
  iam_policies  = each.value.iam_policies
}

module "lambda" {
  # Here, we might need depends_on
  # Cause, we dont want lambda to be invoked, unless policies are attached to role
  # Meaning, lambda will have enough permissions when invoked
  source     = "./lambda"
  depends_on = [module.iam]

  for_each = var.lambdas

  lambda_function_name         = each.key
  lambda_function_description  = each.value.function_description
  lambda_iam_role_arn          = module.iam[each.value.iam_role_name].iam_role_arn
  lambda_handler               = each.value.handler
  lambda_runtime               = each.value.runtime
  lambda_s3_bucket             = each.value.s3_bucket
  lambda_s3_key                = each.value.s3_key
  environment                  = each.value.environment
  lambda_environment_variables = each.value.environment_variables
}

module "api-gateway" {
  source = "./api-gateway"

  rest_api_name        = "test-api"
  rest_api_description = "Test API Description"
  resource             = "orders2"
  http_method          = "POST"
  authorization        = "NONE"
  lambda_invoke_arn    = module.lambda["create-order"].lambda_invoke_arn
  lambda_function_name = module.lambda["create-order"].lambda_function_name
  stage_name           = "dev"
}

module "eventbridge" {
  source = "./eventbridge"

  event_rule_name        = "create-order-rule"
  event_rule_description = "create-order-rule-desc"
  target_id              = "SendToLambda"
  event_target_arn       = module.lambda["process-payment"].lambda_arn
  lambda_function_name   = "process-payment"
  event_bus_name         = "orders-bus"
  event_bus_description  = "order-bus-desc"
}