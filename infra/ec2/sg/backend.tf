terraform{
  backend "s3"{
    bucket  =  "project04-s3-bucket"
    region  =  "ap-northeast-2"
    key     =  "infra/ec2/sg/terrafrom.tfstate"
    dynamodb_table = "project04-terraform-locks"
    encrypt =  true
  }
}