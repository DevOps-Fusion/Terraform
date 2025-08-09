variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name for the SSH key"
  type        = string
}

variable "public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}
