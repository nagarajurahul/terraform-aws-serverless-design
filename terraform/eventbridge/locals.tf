locals {
  flattened_targets = merge([
    for rule_name, rule in var.event_rules : {
      for target_name, target in rule.targets :
      "${rule_name}-${target_name}" => {
        rule_name        = rule_name
        target_name      = target_name
        target_arn       = target.target_arn
        target_id        = target.target_id
        is_lambda_target = try(target.is_lambda_target, false)
        is_sns_target    = try(target.is_sns_target, false)
      }
    }
  ]...)
}