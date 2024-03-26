terraform{
  backend "s3"{
    bucket  =  "project04-s3-bucket"
    region  =  "ap-northeast-2"
    key     =  "globals/s3/terraform.tfstate"
    dynamodb_table = "project04-terraform-locks"
    encrypt =  true
  }
}