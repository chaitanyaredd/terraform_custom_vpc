resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.main.default_route_table_id
  route {
    cidr_block = var.public_cidr
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.env}_route_table"
    env  = var.env
  }
}
