# VPC Module
module "pagopa_pr_api_ms_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = "${var.general_name}-vpc"
  cidr                 = var.vpc_cidr
  azs                  = var.availability_zone
  enable_dns_support   = var.vpc_dns_support
  enable_dns_hostnames = var.vpc_dns_hostnames

  public_subnets  = [var.public_cidr_1, var.public_cidr_2]
  private_subnets = [var.private_cidr_1, var.private_cidr_2]

  enable_nat_gateway = true
  create_igw         = true

  tags = {
    Name = "${var.general_name}-vpc"
  }
}

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

