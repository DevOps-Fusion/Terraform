# Configure AWS provider
provider "aws" {
  region = "us-east-1"  # You can change the region as needed
}

# Create EC2 instance
resource "aws_instance" "test" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"               # Instance type
