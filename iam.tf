# IAM Role for Bastion to create AMIs
resource "aws_iam_role" "bastion" {
  name = "bastion-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name       = "bastion-role"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_iam_role_policy" "bastion_ami" {
  name = "bastion-ami-policy"
  role = aws_iam_role.bastion.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateImage",
          "ec2:DescribeImages",
          "ec2:DescribeInstances",
          "ec2:CreateTags",
          "ec2:RegisterImage",
          "ec2:DeregisterImage",
          "ec2:DescribeSnapshots",
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "bastion" {
  name = "bastion-instance-profile"
  role = aws_iam_role.bastion.name

  tags = {
    Name       = "bastion-instance-profile"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}
