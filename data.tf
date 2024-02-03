data "aws_ecr_authorization_token" "token" {}
# Get the AccountId
data "aws_caller_identity" "current" {}