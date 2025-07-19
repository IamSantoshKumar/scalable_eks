terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 3.0"
  name             = "flask-scalable-vpc"
  cidr             = "10.0.0.0/16"
  azs              = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags = { Terraform = "true" Environment = "dev" }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = ">= 20.0"
  cluster_name    = "flask-scalable-cluster"
  cluster_version = var.k8s_version
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
  manage_aws_auth = true
  eks_managed_node_groups = {
    flask_nodes = {
      desired_size   = 2
      max_size       = 3
      min_size       = 2
      instance_types = ["t3.medium"]
      subnet_ids     = module.vpc.private_subnets
    }
  }
  tags = { Terraform = "true" Environment = "dev_" }
}