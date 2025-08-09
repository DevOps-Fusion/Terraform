terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

#  IAM Role
resource "aws_iam_role" "demo_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

#  Assume Role Policy (Trust Policy)
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

#  IAM Policy (Inline)
data "aws_iam_policy_document" "custom_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
      "arn:aws:s3:::${var.s3_bucket_name}/*"
    ]
  }
}

resource "aws_iam_policy" "demo_policy" {
  name        = "${var.role_name}-policy"
  description = "Custom policy for accessing S3 bucket ${var.s3_bucket_name}"
  policy      = data.aws_iam_policy_document.custom_policy.json
}

#  Attach Policy to Role
resource "aws_iam_role_policy_attachment" "role_attach" {
  role       = aws_iam_role.demo_role.name
  policy_arn = aws_iam_policy.demo_policy.arn
}
