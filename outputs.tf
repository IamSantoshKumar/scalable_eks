output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_ca_certificate" {
  value = module.eks.cluster_certificate_authority_data
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

# From ecr.tf
output "ecr_repository_url" {
  value = aws_ecr_repository.flask_app.repository_url
}