resource "aws_lb_target_group" "ec2_tg" {
  name        = var.alb_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"  # Apunta a instancias EC2

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = var.alb_name
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  count            = length(var.target_group_arn)
  target_group_arn = aws_lb_target_group.ec2_tg.arn
  target_id        = var.target_group_arn[count.index]
  port             = 80
}

resource "aws_lb" "ec2_alb" {
  name               = "ec2-alb"
  internal           = false  # ALB público
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.public_subnets_id  

  tags = {
    Name = "ec2-alb"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.ec2_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2_tg.arn
  }
}