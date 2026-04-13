# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic.html

resource "aws_sns_topic" "sns" {
  name              = var.sns_topic_name
  kms_master_key_id = var.kms_arn
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription
# Reason to switch to email-json protocol
# https://stackoverflow.com/questions/49933987/aws-sns-subscription-keeps-deleting-the-subscription-itself
# https://medium.com/@IT_Sammy/amazon-sns-email-subscription-problems-26e385ced9f5
resource "aws_sns_topic_subscription" "sns_topic" {
  topic_arn = aws_sns_topic.sns.arn
  protocol  = "email-json"
  endpoint  = var.sns_topic_email
}
