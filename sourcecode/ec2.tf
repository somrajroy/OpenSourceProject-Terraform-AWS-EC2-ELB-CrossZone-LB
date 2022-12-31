/* creating 3 VM's
*/

resource "aws_instance" "dev_ec2" {
  count         = length(aws_subnet.demo_public_subnet.*.id)
  instance_type = var.instance_type
  ami           = data.aws_ami.server_ami.id

  tags = {
    Name          = "dev_ec2-${count.index}"
    "Environment" = "Development for LB client demo"
    "CreatedBy"   = "IaC"
  }

  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  subnet_id              = element(aws_subnet.demo_public_subnet.*.id, count.index)
  user_data              = file("awsuserdata.sh")

  root_block_device {
    volume_size = 8
  }
}

resource "aws_eip" "eip" {
  count            = length(aws_instance.dev_ec2.*.id)
  instance         = element(aws_instance.dev_ec2.*.id, count.index)
  public_ipv4_pool = "amazon"
  vpc              = true

  tags = {
    "Name" = "EIP-${count.index}"
  }
}

resource "aws_eip_association" "eip_association" {
  count         = length(aws_eip.eip)
  instance_id   = element(aws_instance.dev_ec2.*.id, count.index)
  allocation_id = element(aws_eip.eip.*.id, count.index)
}