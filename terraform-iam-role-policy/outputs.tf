output "iam_role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.demo_role.name
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy"
  value       = aws_iam_policy.demo_policy.arn
}
