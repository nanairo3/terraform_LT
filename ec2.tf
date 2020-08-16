resource "aws_instance" "web" {
  ami           = var.AMI[var.AWS_REGION]
  instance_type = "t2.micro"

  subnet_id = aws_subnet.tf_public_subnet.id

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  key_name = aws_key_pair.mykeypair.key_name

  private_ip = "10.0.10.10"

  tags = {
    Name = "web"
  }

}