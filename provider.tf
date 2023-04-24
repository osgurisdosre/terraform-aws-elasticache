terraform {
  required_version = ">= 1.0.7"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    template = {
      source  = "hashicorp/template"
      version = "~> 2.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = sso-sirena
  region  = us-east-1
}
