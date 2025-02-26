resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my_key_pair"
  public_key = tls_private_key.my_key.public_key_openssh

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "my_ec2" {
  ami                    = "ami-06ee6255945a96aba"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sec_group.id]

  tags = {
    Name = "MyFirstEC2"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "${tls_private_key.my_key.private_key_pem}" > ~/.ssh/my_key_pair.pem
      chmod 400 ~/.ssh/my_key_pair.pem
    EOT
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -f ~/.ssh/my_key_pair.pem"
  }

  lifecycle {
    replace_triggered_by = [aws_security_group.sec_group]
  }
}