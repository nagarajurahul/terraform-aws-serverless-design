resource "aws_dynamodb_table" "dynamodb_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key = var.dynamodb_table_hash_key

  dynamic "attribute" {
    for_each = var.dynamodb_table_attributes
    content {
      name = attribute.key
      type = attribute.value
    }
  }

  global_secondary_index {
    name = var.global_secondary_index_name
    dynamic "key_schema" {
      for_each = var.global_secondary_index_attributes
      content {
        attribute_name = key_schema.key
        key_type       = key_schema.value
      }
    }
    projection_type = "ALL"
  }

  server_side_encryption {
    enabled = true
  }

}