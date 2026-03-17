output "iam_policy_json" {
  value = {
    for k, v in data.aws_iam_policy_document.policy :
    k => v.json
  }
  description = "ARNs of the IAM policies"
}