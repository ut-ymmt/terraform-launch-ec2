resource "aws_instance" "ec2" {
  count                       = 1
  ami                         = var.ami
  instance_type               = "t2.micro"
  key_name                    = var.key_pair
  subnet_id                   = var.subnet
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = "false"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = "true"
  }

  tags = {
    Name  = var.tags_name
    Owner = var.tags_owner
  }

  volume_tags = {
    Name  = var.tags_name
    Owner = var.tags_owner
  }
}

