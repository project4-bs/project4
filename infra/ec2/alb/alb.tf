resource "aws_lb" "project04-lb" {
  name = "project04-alb"
  load_balancer_type = "application"
  subnets = [ data.terraform_remote_state.vpc.outputs.public1-subnet-2a-id,
              data.terraform_remote_state.vpc.outputs.public2-subnet-2c-id ]
  security_groups = [ data.terraform_remote_state.seg.outputs.aws_security_group_http,
                      data.terraform_remote_state.seg.outputs.aws_security_group_jenkins]
}

#리스너
resource "aws_lb_listener" "jenkins-lb-listener" {
  load_balancer_arn = aws_lb.project04-lb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404"
      status_code = "404"
    }
  }
}
resource "aws_lb_listener_rule" "jenkins-lb-listener-rule" {
  listener_arn = aws_lb_listener.jenkins-lb-listener.arn
  priority = 100
  action {
    type = "forward"
    forward {
     target_group {
       arn = aws_lb_target_group.jenkins-target.arn
       weight = 100
     }
    }
  }
  condition {
    host_header {
      values = [ "project04-jenkins.busanit-lab.com" ]
    }
  }
}
#EKS 관련

#Jenkins 관련 대상 그룹
resource "aws_lb_target_group_attachment" "jenkins" {
  target_group_arn = aws_lb_target_group.jenkins-target.arn
  target_id = data.terraform_remote_state.jenkins.outputs.jenkins_id
  port = 80
  
}
resource "aws_lb_target_group" "jenkins-target" {
  name = "project04-jenkins"
  port = 80
  protocol = "HTTP"
  
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}