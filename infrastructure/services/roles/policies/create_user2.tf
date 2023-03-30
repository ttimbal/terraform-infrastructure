data "aws_iam_policy_document" "create_user2_policy" {
  statement {
    sid = "UniqueSidOne"
    effect  = "Allow"
    actions   = ["sqs:*"]
    resources = ["*"]
  }
}

module "create_user2" {
  source = "../../../../modules/iam/policy"

  name     = "create-user2-${local.environment}"
  policy = data.aws_iam_policy_document.create_user2_policy.json
}

output "create_user2" {
  value = module.create_user2.policy
}