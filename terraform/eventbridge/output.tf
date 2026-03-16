output "event_bus_arn" {
  value       = aws_cloudwatch_event_bus.event_bus.arn
  description = "ARN of the Event Bus"
}