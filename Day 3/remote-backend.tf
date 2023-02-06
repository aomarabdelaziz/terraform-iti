terraform {
  backend "s3" {
    bucket = "terraform-s3-state-bucket-5-1-23"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}