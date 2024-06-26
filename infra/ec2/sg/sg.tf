resource "aws_security_group" "ssh" {
    name = "project04-ssh"
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    ingress {
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "project04-ssh"
  }
}

resource "aws_security_group" "http" {
    name = "project04-http"
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    ingress {
        from_port = var.http_port
        to_port = var.http_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "project04-http"
  }
}
resource "aws_security_group" "jenkins" {
    name = "project04-jenkins"
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    ingress {
        from_port = var.jenkins_port
        to_port = var.jenkins_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "project04-jenkins"
  }
}
resource "aws_security_group" "https" {
    name = "project04-https"
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    ingress {
        from_port = var.https_port
        to_port = var.https_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "project04-https"
  }
}