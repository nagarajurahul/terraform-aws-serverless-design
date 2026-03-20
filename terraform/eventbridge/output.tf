output "event_bus_arn" {
  value       = aws_cloudwatch_event_bus.event_bus.arn
  description = "ARN of the Event Bus"
}

output "event_rule_arns" {
  value = {
    for k, v in aws_cloudwatch_event_rule.event_rule :
    k => v.arn
  }
  description = "ARN of the Event Rules"
}

output "event_target_arns" {
  value = {
    for k, v in aws_cloudwatch_event_target.event_target :
    k => v.arn
  }
  description = "ARN of the Event Targets"
}