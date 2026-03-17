module "policy" {
  source = "../iam-policy-document"

  iam_policies = local.iam_policies
}

resource "aws_cloudwatch_log_resource_policy" "log_resource_policy" {
  policy_document = module.policy.iam_policy_json["eventbridge_logs"]
  policy_name     = "AWSLogDeliveryWrite-${var.resource_name}"
}