locals {
  common_tags = {
    Name        = "My bucket"
    Environment = var.environment
    Managedby   = "Terraform"
  }
  ip_filepath  = "ips.json"
  content_type = "application/json"
}