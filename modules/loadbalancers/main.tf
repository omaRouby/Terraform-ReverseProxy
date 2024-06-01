resource "aws_lb" "public" {
  name               = "public-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.pub_subnets
}

resource "aws_lb" "private" {
  name               = "private-lb"
  internal           = true
  load_balancer_type = "application"
  subnets            = var.priv_subnets
}


resource "aws_lb_target_group" "nginx_target_group" {
  name        = "nginx-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "apache_target_group" {
  name        = "apache-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}
resource "aws_lb_listener" "public_listener" {
  load_balancer_arn = aws_lb.public.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_target_group.arn
  }
}
resource "aws_lb_listener" "private_listener" {
  load_balancer_arn = aws_lb.private.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.apache_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "nginx" {
  count            = length(var.nginx_instance_ids)
  target_group_arn = aws_lb_target_group.nginx_target_group.arn
  target_id        = var.nginx_instance_ids[count.index]
  port             = 80
}

resource "aws_lb_target_group_attachment" "apache" {
  count            = length(var.apache_instance_ids)
  target_group_arn = aws_lb_target_group.apache_target_group.arn
  target_id        = var.apache_instance_ids[count.index]
  port             = 80
}