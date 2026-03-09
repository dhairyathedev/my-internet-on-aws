# Bastion

resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type

  subnet_id = aws_subnet.vpc1_public.id

  tags = {
    Name       = "bastion"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}
