resource "aws_s3_bucket" "b" {
  bucket = "project04-s3-bucket"

  tags = {
    Name        = "project04-s3-bucket"
  }
}