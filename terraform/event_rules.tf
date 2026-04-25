locals {
  event_rules = {
    "order-placed-rule" = {
      event_bus_description = "order-placed-rule-description"
      state                 = "ENABLED"
      event_pattern = {
        source      = ["ecommerce.orders"]
        detail-type = ["OrderPlaced"]
      }
      targets = {
        "first_target" = {
          target_id        = "SendToLambda"
          target_arn       = module.lambda["process-payment"].lambda_arn
          is_lambda_target = true
        }
      }
    }

    "payment-succeeded-rule" = {
      event_bus_description = "payment-succeeded-rule"
      state                 = "ENABLED"
      event_pattern = {
        source      = ["ecommerce.payments"]
        detail-type = ["PaymentSucceeded"]
      }
      targets = {
        "first_target" = {
          target_id        = "SendToSQS"
          target_arn       = module.sqs.sqs_arn
          is_lambda_target = false
        }
        "second-target" = {
          target_id        = "SendToSNS"
          target_arn       = module.sns.sns_arn
          is_lambda_target = false
        }
      }
    }

  }
}