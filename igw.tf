resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_utc_app.id

  tags = {
    Name = "dev-wdp-IGW"
  }
}

# resource "aws_internet_gateway_attachment" "example" {
#   internet_gateway_id = aws_internet_gateway.gw.id
#   vpc_id              = aws_vpc.vpc_utc_app.id
# }