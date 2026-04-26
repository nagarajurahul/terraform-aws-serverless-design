module "policy" {
  source = "../iam-policy-document"

  iam_policies = local.iam_policies
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy
resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  queue_url = var.sqs_queue_id
  policy    = module.policy.iam_policy_json["sqs-queue-policy"]
}