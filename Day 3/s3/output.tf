output "bucket-arn" {
  value = aws_s3_bucket.terraform_state.arn
}

output "bucket-name" {
  value = aws_s3_bucket.terraform_state.bucket
}