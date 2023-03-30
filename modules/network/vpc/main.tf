resource "aws_vpc" "vpc" {
  enable_dns_hostnames = true
  cidr_block           = var.cidr_block

  tags = merge(
    var.tags,
    {
      Name : var.name
    },
  )
}

output "vpc" {
  value = aws_vpc.vpc
}