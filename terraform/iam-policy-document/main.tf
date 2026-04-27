# https://registry.terraform.io/providers/hashicorp/aws/6.41.0/docs/data-sources/iam_policy_document
data "aws_iam_policy_document" "policy" {
  for_each = var.iam_policies

  dynamic "statement" {
    for_each = each.value.statements
    content {
      effect    = statement.value.effect
      actions   = statement.value.actions
      resources = statement.value.resources

      principals {
        type        = "Service"
        identifiers = statement.value.principal_identifiers
      }

      dynamic "condition" {
        for_each = statement.value.conditions
        content {
          test     = condition.value.test
          variable = condition.value.variable
          values   = condition.value.values
        }
      }
    }
  }
}
