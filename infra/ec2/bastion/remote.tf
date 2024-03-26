data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
      bucket = "project04-s3-bucket"
      key = "infra/vpc/terraform.tfstate"
      region = "ap-northeast-2"
    }
}

data "terraform_remote_state" "seg" {
    backend = "s3"
    config = {
      bucket = "project04-s3-bucket"
      key = "infra/ec2/sg/terraform.tfstate"
      region = "ap-northeast-2"
    }
}

data "terraform_remote_state" "sub" {
    backend = "s3"
    config = {
      bucket = "project04-s3-bucket"
      key = "infra/vpc/terraform.tfstate"
      region = "ap-northeast-2"
    }
}