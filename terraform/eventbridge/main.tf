resource "aws_cloudwatch_event_bus" "event_bus" {
  name        = var.event_bus_name
  description = var.event_bus_description

  log_config {
    include_detail = "FULL"
    level          = "INFO"
  }
}

resource "aws_cloudwatch_event_rule" "event_rule" {
  for_each = var.event_rules

  name = each.key
  # description = each.value.event_rule_description
  description = lookup(each.value, "event_rule_description", null)

  event_pattern = jsonencode(each.value.event_pattern)

  # This is for dependency
  event_bus_name = aws_cloudwatch_event_bus.event_bus.name

  # state = "ENABLED"
  state = lookup(each.value, "state", "ENABLED")
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target
resource "aws_cloudwatch_event_target" "event_target" {
  for_each = local.flattened_targets

  # This is for dependency
  event_bus_name = aws_cloudwatch_event_bus.event_bus.name
  depends_on     = [aws_cloudwatch_event_rule.event_rule]

  rule = each.value.rule_name

  target_id = each.value.target_id
  arn       = each.value.target_arn
}