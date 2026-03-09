# Bastion

resource "aws_instance" "bastion" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.bastion_vpc1.id]

  subnet_id                   = aws_subnet.vpc1_public.id
  associate_public_ip_address = true

  tags = {
    Name       = "bastion"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


# Uncomment after creating golden AMI with BIRD2 installed

# resource "aws_instance" "bird_vpc1" {
#   ami                    = var.bird_ami
#   instance_type          = var.instance_type
#   vpc_security_group_ids = [aws_security_group.bird_vpc1.id]
#
#   subnet_id         = aws_subnet.vpc1_private.id
#   source_dest_check = false
#
#   tags = {
#     Name       = "bird_vpc1"
#     Project    = "My Internet on AWS"
#     CreatedVia = var.created_via
#   }
# }

# resource "aws_instance" "bird_vpc2" {
#   ami                    = var.bird_ami
#   instance_type          = var.instance_type
#   vpc_security_group_ids = [aws_security_group.bird_vpc2.id]
#
#   subnet_id         = aws_subnet.vpc2_private.id
#   source_dest_check = false
#
#   tags = {
#     Name       = "bird_vpc2"
#     Project    = "My Internet on AWS"
#     CreatedVia = var.created_via
#   }
# }

# resource "aws_instance" "bird_vpc3" {
#   ami                    = var.bird_ami
#   instance_type          = var.instance_type
#   vpc_security_group_ids = [aws_security_group.bird_vpc3.id]
#
#   subnet_id         = aws_subnet.vpc3_private.id
#   source_dest_check = false
#
#   tags = {
#     Name       = "bird_vpc3"
#     Project    = "My Internet on AWS"
#     CreatedVia = var.created_via
#   }
# }
