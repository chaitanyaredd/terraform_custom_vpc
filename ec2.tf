//"ImageLocation": "309956199498/RHEL-8.4.0_HVM-20210504-x86_64-2-Hourly2-GP2"
//RHEL-8.4.0_HVM-20210504-x86_64-2-Hourly2-GP2

data "aws_ami" "rhel8" {
  most_recent = true
  owners      = var.owner_ids

  filter {
    name   = "name"
    values = ["RHEL-8.4.0_HVM-*", ]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "VM-in-new-vpc" {
  ami                    = data.aws_ami.rhel8.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id] # list
  key_name               = "learnaws"
  tags = {
    Name = "${var.env}_server"
    Env  = var.env
  }
}

