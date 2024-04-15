resource "aws_ecr_repository" "project04-ecr" {
  name= "project04-ecr"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    env = "dev"
    name = "project04-Repository"
  }
  
}