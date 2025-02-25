terraform {
  backend "s3" {
    bucket         = aws_s3_bucket.terraform_state.bucket
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    kms_key_id     = aws_kms_key.terraform_kms_key.arn
    dynamodb_table = aws_dynamodb_table.terraform_locks.id
  }
}