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

resource "docker_image" "fastapi" {
  name = aws_ecr_repository.fastapi.repository_url
  build {
    context    = "${path.module}/microservice-api/api"
    dockerfile = "Dockerfile"
  }
}

resource "docker_image" "authentication" {
  name = aws_ecr_repository.authentication.repository_url
  build {
    context    = "${path.module}/microservice-api/authentication"
    dockerfile = "Dockerfile"
  }
}

resource "docker_image" "authorization" {
  name = aws_ecr_repository.authorization.repository_url
  build {
    context    = "${path.module}/microservice-api/authorization"
    dockerfile = "Dockerfile"
  }
}

resource "docker_image" "content" {
  name = aws_ecr_repository.content.repository_url
  build {
    context    = "${path.module}/microservice-api/content"
    dockerfile = "Dockerfile"
  }
}

resource "docker_registry_image" "fastapi_service" {
  name = docker_image.fastapi.name
}

resource "docker_registry_image" "authentication_service" {
  name = docker_image.authentication.name
}

resource "docker_registry_image" "authorization_service" {
  name = docker_image.authorization.name
}

resource "docker_registry_image" "content_service" {
  name = docker_image.content.name
}
