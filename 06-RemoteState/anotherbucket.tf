resource "aws_s3_bucket" "test" {
  bucket = "test-bucket-aosdjasad-9218u321-3mscopm9"

  tags = {
    Imported  = "07/09/23"
    Managedby = "Terraform"
    Test = "Test"
  }
}