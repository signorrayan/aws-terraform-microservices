# Create an s3 bucket that is using in python scripts to save their output
resource "aws_s3_bucket" "logs_bucket" {
  bucket = "pr-microservices-logs-mhmdrza" # Change this to your desired bucket name
}

# ECR Repositories
resource "aws_ecr_repository" "fastapi" {
  name = "${var.general_name}-fastapi-service"
}

resource "aws_ecr_repository" "authentication" {
  name = "${var.general_name}-authentication-service"
}

resource "aws_ecr_repository" "authorization" {
  name = "${var.general_name}-authorization-service"
}

resource "aws_ecr_repository" "content" {
  name = "${var.general_name}-content-service"
}