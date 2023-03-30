module "create_user" {
  source = "../../../modules/iam/role"

  name = "create-user-${local.environment}"
  assume_role = {
    type="Service"
    identifiers=["lambda.amazonaws.com"]
  }

  policy_arns = [
    module.policy.create_user.arn,
    module.policy.create_user2.arn,
  ]
}

output "create_user" {
  value = module.create_user.role
}