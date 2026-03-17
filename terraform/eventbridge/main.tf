resource "aws_cloudwatch_event_bus" "event_bus" {
  name        = var.event_bus_name
  description = var.event_bus_description

  log_config {
    include_detail = "FULL"
    level          = "INFO"
  }
}

resource "aws_cloudwatch_event_rule" "event_rule" {
  name        = var.event_rule_name
  description = var.event_rule_description

  event_pattern = jsonencode({
    "source" : ["ecommerce.orders"],
    "detail-type" : ["OrderPlaced"]
  })

  # This is for dependency
  event_bus_name = aws_cloudwatch_event_bus.event_bus.name

  state          = "ENABLED"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target
resource "aws_cloudwatch_event_target" "event_target" {
  # This is for dependency
  event_bus_name = aws_cloudwatch_event_bus.event_bus.name
  rule           = aws_cloudwatch_event_rule.event_rule.name

  target_id      = var.target_id
  arn            = var.event_target_arn
}