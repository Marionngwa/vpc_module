resource "aws_subnet" "utc_public" {
  vpc_id     = aws_vpc.vpc_utc_app.id
  count = 2
  cidr_block = cidrsubnet(aws_vpc.vpc_utc_app.cidr_block, 8, count.index)


  tags = {
    Name = "utc_public_subnet${count.index}"
    #Name = var.pblic_subnets[count.index]
  }
}


resource "aws_subnet" "utc_private" {
  vpc_id     = aws_vpc.vpc_utc_app.id
  count = 2
  cidr_block = cidrsubnet(aws_vpc.vpc_utc_app.cidr_block, 8, count.index +2)


  tags = {
    Name = "utc_private_subnet${count.index}"
  }
}

# variable "pblic_subnets" {
#   type = list
#   default = ["utc_sub01", "uc_sub02"]
# }