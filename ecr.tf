resource "aws_ecr_repository" "flask_app" {
  name = var.ecr_repo_name
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.flask_app.repository_url
}