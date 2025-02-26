resource "aws_security_group" "sec_group" {
  name        = "my_sec_group"
  description = "Allow inbound and outbound traffic"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_inbound_traffic" {
  security_group_id = aws_security_group.sec_group.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0" # RESTRICT TO YOUR IP RANGE
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh_outbound_traffic" {
  security_group_id = aws_security_group.sec_group.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}

# RESTRICT PORTS TO YOUR NEEDS

resource "aws_vpc_security_group_ingress_rule" "allow_all_inbound_traffic" {
  security_group_id = aws_security_group.sec_group.id
  ip_protocol       = "-1"
  from_port         = 0
  to_port           = 0
  cidr_ipv4         = "0.0.0.0/0" # RESTRICT TO YOUR IP RANGE
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_traffic" {
  security_group_id = aws_security_group.sec_group.id
  ip_protocol       = "-1"
  from_port         = 0
  to_port           = 0
  cidr_ipv4         = "0.0.0.0/0"
}