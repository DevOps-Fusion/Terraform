# Create Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# Security Group for SSH Access
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Get default subnet
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

# Launch EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_key.key_name
  subnet_id     = element(data.aws_subnet_ids.default.ids, 0)
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "MyTerraformEC2"
  }
}