data "aws_iam_policy_document" "policy" {
  statement {
    effect  = "Allow"
    actions = [
      "ec2:Describe*"
    ]
    resources = ["*"]
  }

  statement {
    sid = "UniqueSidOne"

    actions   = ["s3:*"]
    resources = ["*"]
  }
}

module "create_user" {
  source = "../../../../modules/iam/policy"

  name     = "create-user-${local.environment}"
  policy = data.aws_iam_policy_document.policy.json
}

output "create_user" {
  value = module.create_user.policy
}