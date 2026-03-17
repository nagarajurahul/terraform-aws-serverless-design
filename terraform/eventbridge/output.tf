output "event_bus_arn" {
  value       = aws_cloudwatch_event_bus.event_bus.arn
  description = "ARN of the Event Bus"
}

output "event_rule_arn" {
  value       = aws_cloudwatch_event_rule.event_rule.arn
  description = "ARN of the Event Rule"
}

output "event_target_arn" {
  value       = aws_cloudwatch_event_target.event_target.arn
  description = "ARN of the Event Target"
}