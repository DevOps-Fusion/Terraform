variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "role_name" {
  description = "IAM Role name"
  type        = string
  default     = "demo-ec2-role"
}

variable "s3_bucket_name" {
  description = "S3 bucket to allow access"
  type        = string
  default     = "my-demo-bucket"
}
