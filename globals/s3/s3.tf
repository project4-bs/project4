resource "aws_s3_bucket" "s3" {
  bucket = "project04-s3-bucket"
  force_destroy = true

  tags = {
    Name        = "project04-s3-bucket"
  }
}

resource "aws_dynamodb_table" "terraform-locks" {
  name         = "project04-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
