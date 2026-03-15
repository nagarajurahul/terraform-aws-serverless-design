data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = [var.iam_principal]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "policy" {
  for_each = var.iam_policies

  dynamic "statement" {
    for_each = each.value.statements
    content {
      effect    = statement.value.effect
      actions   = statement.value.actions
      resources = statement.value.resources
    }
  }
}

resource "aws_iam_policy" "policy" {
  for_each = var.iam_policies

  name        = each.key
  description = each.key
  policy      = data.aws_iam_policy_document.policy[each.key].json
}

resource "aws_iam_role_policy_attachment" "attach" {
  for_each = var.iam_policies

  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy[each.key].arn
}