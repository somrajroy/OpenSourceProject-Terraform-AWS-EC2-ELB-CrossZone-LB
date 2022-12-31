resource "aws_lb_target_group" "target_group" {
  name        = "TargetGroup"
  port        = 80
  target_type = "ip"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.demo_vpc.id
}

resource "aws_lb" "load_balancer" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demo_sg.id, ]
  subnets            = aws_subnet.demo_public_subnet.*.id
}

resource "aws_alb_target_group_attachment" "tg_attachment" {
  #count            = length(aws_instance.dev_ec2.*.id) == 3 ? 3 : 0
  count            = length(aws_instance.dev_ec2)
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.dev_ec2[count.index].private_ip
  port             = 80
}

#create listener

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

#listener rule

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.web.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn

  }

  condition {
    path_pattern {
      values = ["/var/www/html/index.html"]
    }
  }
}