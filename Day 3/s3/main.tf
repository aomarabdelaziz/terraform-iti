resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3-bucket-name

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = var.status
  }
}

