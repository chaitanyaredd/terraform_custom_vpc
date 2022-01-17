## vpc.tf
resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "${var.env}_vpc"
    Env  = var.env
  }
}
