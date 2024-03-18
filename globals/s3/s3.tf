resource "aws_s3_bucket" "s3" {
  bucket = "project04-s3-bucket"

  tags = {
    Name        = "project04-s3-bucket"
  }
}