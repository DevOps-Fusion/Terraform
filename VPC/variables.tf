variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}

variable "public_subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "Public subnet CIDR block"
}

variable "private_subnet_cidr" {
  default     = "10.0.2.0/24"
  description = "Private subnet CIDR block"
}

variable "availability_zone" {
  default     = "us-east-1a"
  description = "Availability Zone for subnets"
}

variable "vpc_name" {
  default     = "demo-vpc"
  description = "Name tag for the VPC"
}