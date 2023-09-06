// Bucket
resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}-5123123"

  tags = local.common_tags
}

// Ownership
resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

// Private
resource "aws_s3_bucket_acl" "this" {
  depends_on = [aws_s3_bucket_ownership_controls.this]

  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

//Object
resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.id
  key    = "config/${local.ip_filepath}"
  source = local.ip_filepath
  etag   = filemd5(local.ip_filepath)
}