module "iam" {
  source = "./iam"

  iam_role_name = var.iam_role_name
  iam_principal = var.iam_principal
  iam_policies  = var.iam_policies
}