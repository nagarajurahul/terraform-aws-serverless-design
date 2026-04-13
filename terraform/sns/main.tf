# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic.html

resource "aws_sns_topic" "sns" {
  name              = var.sns_topic_name
  kms_master_key_id = var.kms_arn
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription
resource "aws_sns_topic_subscription" "sns_topic" {
  topic_arn = aws_sns_topic.sns.arn
  protocol  = "email"
  endpoint  = var.sns_topic_email
}