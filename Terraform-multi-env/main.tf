module "vpc" {
  source = "./modules/vpc"
  env    = var.env
}

module "s3" {
  source      = "./modules/s3"
  env         = var.env
}

module "iam" {
  source      = "./modules/iam"
  env         = var.env
}

module "ec2" {
  source      = "./modules/ec2"
  env         = var.env
  vpc_id      = module.vpc.vpc_id
  subnet_id   = module.vpc.public_subnet_id
  iam_role    = module.iam.instance_role_name
}
