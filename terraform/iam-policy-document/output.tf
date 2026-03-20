output "iam_policy_json" {
  value = {
    for k, v in data.aws_iam_policy_document.policy :
    k => v.json
  }
  description = "JSON of the IAM policies"
}