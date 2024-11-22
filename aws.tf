terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.68.0"
    }
  }
  backend "s3" {
    bucket = "jayraj-iqm-terraform-tfstate"
    key    = "terraform-config/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = terraform.workspace
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
}

# provider "aws" {
#   alias = "us-west-2"
#   region = "us-west-2"
#   profile = terraform.workspace
# }