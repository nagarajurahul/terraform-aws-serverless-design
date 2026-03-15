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