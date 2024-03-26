resource "aws_instance" "bastion" {
    ami = "ami-0d3d9b94632ba1e57"
    instance_type = "t2.micro"
    key_name = "project04-key"

    subnet_id = data.terraform_remote_state.vpc.outputs.public1-subnet-2a-id
    vpc_security_group_ids = [ data.terraform_remote_state.seg.outputs.aws_security_group_ssh ]
   
   ## 퍼블릭 IP 활성화 ##
    associate_public_ip_address = true
    tags = {
        Name = "project04-bastion-instance"
    }
}