resource "aws_iam_policy" "policy" {
  name = var.name
  policy = var.policy
  description = var.description

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )
}

output "policy" {
  value = aws_iam_policy.policy
}