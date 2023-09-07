resource "aws_s3_bucket" "imported" {
    bucket = "manually-created-asodjc-9218u321-3mscopm9"

    tags = {
        Imported = "07/09/23"
        Managedby = "Terraform"
    }
}