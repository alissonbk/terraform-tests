locals {
  common_tags = {
    "Owner"     = "Alisson"
    Environment = var.env
    Managedby   = "Terraform"
  }
  instance_type   = lookup(var.instance_type, var.env)
  instance_number = lookup(var.instance_number, var.env)
  file_ext        = "zip"
  object_name     = "file-generated-from-template"
}