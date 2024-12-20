resource "aws_vpc" "vpc_utc_app" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  #s3_endpoint = "no"

  tags = {
    Name = var.vpc_name
    env = "dev"
    team = "wdp"
    created_by = "marion"
  }
}

resource "aws_nat_gateway" "utc_nat" {
  allocation_id = aws_eip.utc_eip.id
  subnet_id     = aws_subnet.utc_private[0].id

  tags = {
    Name = var.NAT_name
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "utc_eip" {
  domain   = "vpc"
}