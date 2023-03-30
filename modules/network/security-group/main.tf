resource "aws_security_group" "security_group" {
  vpc_id = var.vpc_id

  name        = var.name
  description = var.description

  dynamic "ingress" {
    for_each = var.ingress == null ? [] : var.ingress
    content {
      description      = ingress.value["description"]
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value["cidr_blocks"]==null ? [] : ingress.value["cidr_blocks"]
      ipv6_cidr_blocks = ingress.value["ipv6_cidr_blocks"]==null ? [] : ingress.value["ipv6_cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = var.egress == null ? [] : var.egress
    content {
      description      = egress.value["description"]
      from_port        = egress.value["from_port"]
      to_port          = egress.value["to_port"]
      protocol         = egress.value["protocol"]
      cidr_blocks      = egress.value["cidr_blocks"]==null ? [] : egress.value["cidr_blocks"]
      ipv6_cidr_blocks = egress.value["ipv6_cidr_blocks"]==null ? [] : egress.value["ipv6_cidr_blocks"]
    }
  }

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )
}

output "security_group" {
  value = aws_security_group.security_group
}