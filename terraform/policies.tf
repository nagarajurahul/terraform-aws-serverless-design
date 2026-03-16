locals {
  iam_roles = {
    create-order-role = {
      principal = "lambda.amazonaws.com"

      iam_policies = {
        create-order-dynamodb-policy = {
          statements = [{
            effect    = "Allow"
            actions   = ["dynamodb:PutItem"]
            resources = [module.dynamodb.dynamodb_table_arn]
          }]
        }

        create-order-cloudwatch-logs-policy = {
          statements = [{
            effect = "Allow"
            actions = [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ]
            resources = ["arn:aws:logs:*:*:*"]
          }]
        }
      }

    }

    process-payment-role = {
      principal = "lambda.amazonaws.com"

      iam_policies = {
        process-payment-cloudwatch-logs-policy = {
          statements = [{
            effect = "Allow"
            actions = [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ]
            resources = ["arn:aws:logs:*:*:*"]
          }]
        }
      }

    }
  }
}