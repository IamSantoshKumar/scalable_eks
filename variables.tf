variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "k8s_version" {
  type    = string
  default = "1.29"
}

variable "ecr_repo_name" {
  type    = string
  default = "flask-scalable-app"
}