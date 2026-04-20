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

        create-order-event-bus-policy = {
          statements = [{
            effect    = "Allow"
            actions   = ["events:PutEvents"]
            resources = [module.eventbridge.event_bus_arn]
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

        process-payment-event-bus-policy = {
          statements = [{
            effect    = "Allow"
            actions   = ["events:PutEvents"]
            resources = [module.eventbridge.event_bus_arn]
          }]
        }

      }

    }

    update-inventory-role = {
      principal = "lambda.amazonaws.com"

      iam_policies = {
        update-inventory-cloudwatch-logs-policy = {
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

        update-shipment-event-bus-policy = {
          statements = [{
            effect    = "Allow"
            actions   = ["events:PutEvents"]
            resources = [module.eventbridge.event_bus_arn]
          }]
        }

        update-inventory-sqs-policy = {
          statements = [{
            effect = "Allow"
            actions = [
              "sqs:ReceiveMessage",
              "sqs:DeleteMessage",
              "sqs:GetQueueAttributes",
              "sqs:ChangeMessageVisibility"
            ]
            resources = [module.sqs.sqs_arn]
          }]
        }

        # update-inventory-dynamodb-policy = {
        #   statements = [{
        #     effect    = "Allow"
        #     actions   = ["dynamodb:PutItem"]
        #     resources = [module.dynamodb.dynamodb_table_arn]
        #   }]
        # }

      }

    }
  }
}