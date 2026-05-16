provider "aws" {
  region = "us-east-1"
}

#checkov:skip=CKV_AWS_144: Cross-region replication not required
#checkov:skip=CKV2_AWS_61: Lifecycle policy skipped for simplicity
#checkov:skip=CKV2_AWS_62: Event notification skipped
#checkov:skip=CKV_AWS_18: Access logging skipped for student project

resource "aws_s3_bucket" "example" {
  bucket = "my-secure-devsecops-bucket123"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.example.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = "alias/aws/s3"
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
