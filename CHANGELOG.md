# [1.1.0](https://github.com/signorrayan/aws-terraform-microservices/compare/v1.0.0...v1.1.0) (2024-02-03)


### Bug Fixes

* **s3_bucket:** Created s3_output_bucket variable. ([d427712](https://github.com/signorrayan/aws-terraform-microservices/commit/d42771244c2323845d2d672cb00965ea988c094f))


### Features

* **microservices:** Added microservices directory. ([0fc931b](https://github.com/signorrayan/aws-terraform-microservices/commit/0fc931b0bb257d287a2c1b50ad77bec0c5d07bbc))

# 1.0.0 (2024-02-03)


### Features

* **application_load_balancer:** Created ALB to route traffic to API. ([2f1fd56](https://github.com/signorrayan/aws-terraform-microservices/commit/2f1fd56763445e6a990126ad3098dd4edc2231ce))
* **aws_ecr_repository:** Created ECR repositories for each microservice (FastAPI, Authentication, Authorization, Content). ([22799e8](https://github.com/signorrayan/aws-terraform-microservices/commit/22799e839f34010c247ce59e62f06c636dce9008))
* **cloudwatch_log_group:** Created a CloudWatch log group for ECS logs. ([33c4788](https://github.com/signorrayan/aws-terraform-microservices/commit/33c47887a93fb30900a9d759a8c60dc4a4cd90a6))
* **cloudwatch_metric_alarm:** Set up CloudWatch alarms for ECS service memory and CPU scale out. ([45b48bc](https://github.com/signorrayan/aws-terraform-microservices/commit/45b48bcd7a3bf224f98e96e9354841144db9f2e2))
* **configuration:** Added required variables, data.tf, and local.tf. ([1d06486](https://github.com/signorrayan/aws-terraform-microservices/commit/1d064863e6f1cadd964c6b2c70677aa51a54a6db))
* **docker_image:** Built Docker images for each microservice and pushed to ECR. ([809692a](https://github.com/signorrayan/aws-terraform-microservices/commit/809692aa17b522f5188cbfed8bb0236826c62c2f))
* **ecs_cluster:** Set up ECS cluster for microservices. ([3316396](https://github.com/signorrayan/aws-terraform-microservices/commit/3316396e8bf787315eeb34786646e35dd63844a1))
* **ecs_service:** Configured ECS services for each microservice. ([fba6e9b](https://github.com/signorrayan/aws-terraform-microservices/commit/fba6e9b8f0f2ec0001d58df6fad318b0c742bc35))
* **ecs_task_definition:** ECS task definitions for microservice with Fargate compatibility. ([2c9448f](https://github.com/signorrayan/aws-terraform-microservices/commit/2c9448f53c0b2fc593f2bb3785833e4a4250eb39))
* **iam_role:** Created IAM roles and policies for ECS and S3 access. ([539fcfc](https://github.com/signorrayan/aws-terraform-microservices/commit/539fcfcc57d22594cebd0aa296f469cb7e620399))
* **outputs:** Set up outputs.tf to show alb domain name. ([0159d8e](https://github.com/signorrayan/aws-terraform-microservices/commit/0159d8eb121a0d53f14f57c0b5d8795c98032f61))
* **provider:** Added required providers and backend. ([a0c67e7](https://github.com/signorrayan/aws-terraform-microservices/commit/a0c67e79d21991f534440269f7c21c993412e9d1))
* **S3Config:** Provisioned an AWS S3 bucket for Python scripts output. ([cca9892](https://github.com/signorrayan/aws-terraform-microservices/commit/cca989288c631ec5056642c16e578616e3288b95))
* **security_group:** Configured security group for ingress/egress traffic. ([f141293](https://github.com/signorrayan/aws-terraform-microservices/commit/f1412939f85a52eb120902535f0b6529a737426b))
* **ssm_parameter:** Created a SSM Parameter for API dns. ([8c2dc8a](https://github.com/signorrayan/aws-terraform-microservices/commit/8c2dc8a3bd889c693c39b249aa66468ed0812019))
* **vpc:** Added VPC module for related Virtual Private Cloud services. ([c70208b](https://github.com/signorrayan/aws-terraform-microservices/commit/c70208b143780eab50d8e1643ec61aa7867908cf))
