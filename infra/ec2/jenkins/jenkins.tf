resource "aws_instance" "jenkins" {
  ami = "ami-0d3d9b94632ba1e57"
  instance_type = "t3.large"
  key_name = "project04-key"
  private_ip = "10.4.64.64"
  subnet_id = data.terraform_remote_state.vpc.outputs.private1-subnet-2a-id
  security_groups = [ data.terraform_remote_state.seg.outputs.aws_security_group_ssh,
                      data.terraform_remote_state.seg.outputs.aws_security_group_http]
  
  user_data = templatefile("templates/userdata.sh",{})
  tags = {
    Name = "project04-jenkins"
  }
}