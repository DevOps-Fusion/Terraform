variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "env" {
  description = "Environment name (dev, stage, prod)"
  type        = string
}