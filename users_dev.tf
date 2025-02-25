module "new_user_dev" {
  source          = "./modules/iam_user_dev"
  user_name       = var.dev_user_name
  ec2_policy_file = "policies/ec2_policy.json"
  s3_policy_file  = "policies/s3_policy.json"
}
