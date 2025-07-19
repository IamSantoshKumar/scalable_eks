resource "aws_ecr_repository" "main" {
  name                 = "flask-webapp-ecr"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.main.repository_url
}
