module "security_group" {
  source = "../../modules/network/security-group"

  name = "security-group-${local.environment}"

  vpc_id = module.vpc.vpc.id

  ingress = [
    {
      from_port=8080
      to_port=8080
      protocol="tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port=80
      to_port=80
      protocol="tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port=22
      to_port=22
      protocol="tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port=443
      to_port=443
      protocol="tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress = [
    {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
