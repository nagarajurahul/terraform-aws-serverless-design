module "policy" {
  source = "../iam-policy-document"

  iam_policies = local.iam_policies
}
resource "aws_kms_key_policy" "kms_key_policy" {
  key_id = var.kms_key_id
  policy = module.policy.iam_policy_json["kms-key-policy"]
}
