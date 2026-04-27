data "aws_caller_identity" "current" {}

locals {
  iam_policies = {
    "sqs-queue-policy" = {
      statements = [
        {
          sid = "AllowEventBridgeToSendMessage"

          effect    = "Allow"
          actions   = ["sqs:SendMessage"]
          resources = [var.sqs_queue_arn]

          principals = [
            {
              type        = "Service",
              identifiers = ["events.amazonaws.com"]
            }
          ]

          conditions = [
            {
              test     = "StringEquals"
              variable = "aws:SourceAccount"
              values   = [data.aws_caller_identity.current.account_id]
            },
            {
              test     = "ArnEquals"
              variable = "aws:SourceArn"
              values   = var.source_arns["eventbridge"]
            }
          ]
        }
      ]

    }
  }
}