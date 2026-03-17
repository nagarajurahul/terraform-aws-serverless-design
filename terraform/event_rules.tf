locals {
  event_rules = {
    "create-order-rule" = {
      event_bus_description = "create-order-rule-description"
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
  }
}