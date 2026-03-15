module "iam" {
  source = "./iam"

  iam_role_name          = var.iam_role_name
  iam_policy_name        = var.iam_policy_name
  iam_policy_description = var.iam_policy_description
  iam_principal          = var.iam_principal
}