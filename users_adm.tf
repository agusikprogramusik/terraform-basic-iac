module "new_user_adm" {
  source                          = "./modules/iam_user_adm"
  user_name                       = var.adm_user_name
  administator_access_policy_file = "policies/administrator_access_policy.json"
}