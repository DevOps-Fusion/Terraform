resource "aws_instance" "this" {
  ami           = "ami-0c7217cdde317cfec" # Amazon Linux 2 in us-east-1
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  iam_instance_profile = aws_iam_instance_profile.this.name

  tags = {
    Name = var.instance_name
  }
}

resource "aws_iam_instance_profile" "this" {
  name = "${var.instance_name}-profile"
  role = var.iam_instance_role
}