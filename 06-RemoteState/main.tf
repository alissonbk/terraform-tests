terraform {
  required_version = "1.5.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.14.0"
    }
  }
  // Cannot use variables or interpolation inside terraform core block
  backend "s3" {
    bucket  = "tfstate-379455329728"
    key     = "dev/using-remote-state/terraform.tfstate"
    region  = "us-east-1"
    profile = "personal"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

