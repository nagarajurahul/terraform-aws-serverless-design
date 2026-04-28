data "aws_caller_identity" "current" {}

locals {
  iam_policies = {
    "kms-key-policy" = {
      statements = concat(
        [
          {
            sid       = "Enable IAM User Permissions"
            effect    = "Allow"
            actions   = ["kms:*"]
            resources = ["*"]
            principals = [
              {
                type        = "AWS"
                identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
              }
            ]
          }
        ],
        length(var.eventbridge_source_arns) > 0 ?
        [
          {
            sid    = "AllowEventBridgeToUseKeyForEncryptedSQSTarget"
            effect = "Allow"
            actions = [
              "kms:GenerateDataKey",
              "kms:Decrypt"
            ]
            resources = ["*"]
            principals = [
              {
                type        = "Service"
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
                values   = var.eventbridge_source_arns
              }
            ]
          }
        ] : [],
        length(var.sqs_arns) > 0 ?
        [
          {
            sid    = "AllowSQSServiceToUseKey"
            effect = "Allow"
            actions = [
              "kms:GenerateDataKey",
              "kms:Decrypt"
            ]
            resources = ["*"]
            principals = [
              {
                type        = "Service"
                identifiers = ["sqs.amazonaws.com"]
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
                values   = var.sqs_arns
              }
            ]
          }
        ] : [],
        length(var.lambda_role_arns) > 0 ?
        [
          {
            sid    = "AllowLambdaToDecryptSQS"
            effect = "Allow"
            actions = [
              "kms:Decrypt"
            ]
            resources = ["*"]
            principals = [
              {
                type        = "AWS"
                identifiers = var.lambda_role_arns
              }
            ]
            conditions = []
          }
        ] : []
      )
    }
  }
}