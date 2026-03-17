resource "aws_cloudwatch_log_group" "log_group" {
  name = var.log_group_name

  log_group_class   = "STANDARD"
  retention_in_days = var.retention_in_days
}

resource "aws_cloudwatch_log_delivery_destination" "log_delivery_destination" {
  name = var.log_delivery_destination_name

  delivery_destination_configuration {
    destination_resource_arn = aws_cloudwatch_log_group.log_group.arn
  }
}

resource "aws_cloudwatch_log_delivery_source" "log_delivery_source" {
  name         = var.log_delivery_source_name
  log_type     = var.log_type
  resource_arn = var.resource_arn
}

resource "aws_cloudwatch_log_delivery" "log_delivery" {
  delivery_destination_arn = aws_cloudwatch_log_delivery_destination.log_delivery_destination.arn
  delivery_source_name     = aws_cloudwatch_log_delivery_source.log_delivery_source.name
}