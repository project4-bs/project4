data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "project04-s3-bucket"
    key    = "infra/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}