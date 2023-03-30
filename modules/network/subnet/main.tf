resource "aws_subnet" "subnet" {
  vpc_id = var.vpc_id

  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone

  tags = merge(
    var.tags,
    {
      Name = var.name
    },
  )
}

output "subnet" {
  value = aws_subnet.subnet
}