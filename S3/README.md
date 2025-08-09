## Overview
This Terraform project creates an AWS S3 bucket with optional versioning support.  
The bucket name, region, and tags can be customized via variables.

## Files
- `provider.tf` → AWS provider configuration
- `variables.tf` → Input variables for the project
- `main.tf` → S3 bucket and versioning configuration
- `outputs.tf` → Outputs for bucket name & ARN
- `terraform.tfvars` → Variable values for deployment