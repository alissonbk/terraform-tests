terraform {
  required_version = "1.5.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.14.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "personal"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-9999997999901293480cm09oisadu5f432"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
    Owner       = "Eu memo"
    UpdatedAt   = "2023-08-29"
  }
}

resource "aws_s3_bucket_ownership_controls" "my-test-bucket" {
  bucket = aws_s3_bucket.my-test-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "my-test-bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.my-test-bucket]

  bucket = aws_s3_bucket.my-test-bucket.id
  acl    = "private"
}