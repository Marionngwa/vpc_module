variable "region" {
  type = string
  default = "us-east-1"
}

variable "cidr_block" {
  type = number
  default = "172.120.0.0/16"
}

variable "vpc_name" {
  type = string
  default = "utc-app1"
}

variable "NAT_name" {
  type = string
  default = "UTC_NAT"
}

variable "sg_name" {
  type = string
  default = "webserver-sg"

}