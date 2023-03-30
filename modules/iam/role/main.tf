data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = var.assume_role.type
      identifiers = var.assume_role.identifiers
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  count = length(var.policy_arns)

  role       = aws_iam_role.role.name
  policy_arn = var.policy_arns[count.index]
}

output "role" {
  value = aws_iam_role.role
}