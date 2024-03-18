terraform{
  backend "s3"{
    bucket  =  "project04-s3-bucket"
    regin   =  "ap-northeast-2"
    key     =  "globals/s3/terrafrom.tfstate"
    dynamodb_table = "project04-terraform-locks"
    encrypt =  true
  }
}