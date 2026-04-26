output "kms_key_policy" {
  value       = aws_kms_key_policy.kms_key_policy.policy
  description = ""
}
