locals {
  tags = {
    created_by = "terraform"
  }
  account_id  = data.aws_caller_identity.current.account_id
  aws_ecr_url = "${local.account_id}.dkr.ecr.${var.region}.amazonaws.com"
}