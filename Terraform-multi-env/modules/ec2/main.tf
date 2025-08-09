resource "aws_instance" "web" {
  ami           = "ami-0f5ee92e2d63afc18" # Change as per region
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.generated_key.key_name
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  tags = {
    Name = "${var.env}-ec2"
  }
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${var.env}-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.env}-instance-profile"
  role = var.iam_role
}
