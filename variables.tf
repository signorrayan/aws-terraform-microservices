#####################################
# Generic Input Variables
#####################################

variable "region" {
  description = "The instance region"
  type        = string
  default     = "eu-west-1"
}

variable "ecr_name" {
  type        = string
  description = "Name for Elastic Container Registry"
  default     = "pagopa-pr-api-ecr"
}

variable "general_name" {
  type        = string
  description = "General Name of the project"
  default     = "pagopa-pr-ms-api"
}

variable "role_name" {
  type    = string
  default = "pagopa-pr-api-role"
}

variable "s3_policy_name" {
  type    = string
  default = "pagopa-pr-api-s3-policy"
}

# variable "aws_account_id" {
#   description = "AWS Account ID for creating Docker repositories"
# }

# The CIDR block for the VPC to create.
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

# A boolean flag to enable/disable DNS support in the VPC.  Defaults true.
variable "vpc_dns_support" {
  description = "Should DNS support be enabled for the VPC?"
  type        = bool
  default     = true
}

# A boolean flag to enable/disable DNS hostnames in the VPC.  Defaults true.
variable "vpc_dns_hostnames" {
  description = "Should DNS hostnames support be enabled for the VPC?"
  type        = bool
  default     = true
}

# The CIDR block for the public subnet.  This block should be a range within the above VPC CIDR.
variable "public_cidr_1" {
  description = "The CIDR block for the first public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

# The CIDR block for the public subnet.  This block should be a range within the above VPC CIDR.
variable "public_cidr_2" {
  description = "The CIDR block for the second public subnet."
  type        = string
  default     = "10.0.2.0/24"
}

# The CIDR block for the first private subnet.  This block should be a range within the above VPC CIDR.
variable "private_cidr_1" {
  description = "The CIDR block for the first private subnet."
  type        = string
  default     = "10.0.3.0/24"
}

# The CIDR block for the second private subnet.  This block should be a range within the above VPC CIDR.
variable "private_cidr_2" {
  description = "The CIDR block for the second private subnet."
  type        = string
  default     = "10.0.4.0/24"
}

# A list of allowed availability zones.
variable "availability_zone" {
  description = "A list of allowed availability zones."
  type        = list(any)
  default     = ["eu-west-1a", "eu-west-1c"]
}

# A boolean flag to map the public IP on launch for public subnets.  Defaults true.
variable "map_public_ip" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  type        = bool
  default     = true
}

variable "fastapi_desired_count" {
  description = "Desired count for the FastAPI ECS service"
  type        = number
  default     = 1
}

variable "s3_output_bucket" {
  description = "S3 bucket for the output of the microservices"
  type        = string
  default     = "pagopa-pr-api-s3"
}