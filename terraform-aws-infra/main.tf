module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-terraform-demo-bucket-12345"
}

module "iam" {
  source      = "./modules/iam"
  role_name   = "ec2_s3_access_role"
  policy_name = "ec2_s3_access_policy"
  s3_bucket_arn = module.s3.bucket_arn
}

module "ec2" {
  source             = "./modules/ec2"
  instance_name      = "my-ec2-instance"
  instance_type      = "t2.micro"
  public_subnet_id   = module.vpc.public_subnet_id
  key_name           = "my-keypair"
  iam_instance_role  = module.iam.role_name
}
