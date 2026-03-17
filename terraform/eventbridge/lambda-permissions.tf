# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission
resource "aws_lambda_permission" "allow_eventbridge" {
  for_each = {
    for k, v in local.flattened_targets : k => v
    if v.is_lambda_target
  }
  statement_id  = "AllowExecutionFromEventBridge-${each.key}"
  action        = "lambda:InvokeFunction"
  function_name = each.value.target_arn
  principal     = "events.amazonaws.com"

  source_arn = aws_cloudwatch_event_rule.event_rule[each.value.rule_name].arn
}