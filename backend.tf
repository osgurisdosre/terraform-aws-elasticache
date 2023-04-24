terraform {
  backend "s3" {
    bucket               = "tfstate-sirena"
    key                  = "elasticache/terraform.tfstate"
    workspace_key_prefix = "environments"
    region               = "us-east-1"
    profile              = "sso-sirena"
    dynamodb_table       = "tflock-tfstate-sirena"
    role_arn             = "arn:aws:iam::024370237297:role/TerraformBackend"
  }
}