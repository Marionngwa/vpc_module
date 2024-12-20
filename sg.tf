resource "aws_security_group" "utc_local_sg" {
  name        = "webserver-sg"
  description = "sg for utc app"
  vpc_id      = aws_vpc.vpc_utc_app.id

  tags = {
    Name = "webserver-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "utc_ssh" {
  security_group_id = aws_security_group.utc_local_sg.id
  cidr_ipv4         = aws_vpc.vpc_utc_app.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "utc_http" {
  security_group_id = aws_security_group.utc_local_sg.id
  cidr_ipv4         = aws_vpc.vpc_utc_app.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "utc_Jenkins" {
  security_group_id = aws_security_group.utc_local_sg.id
  cidr_ipv4         = aws_vpc.vpc_utc_app.cidr_block
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.utc_local_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

