#####################################
# alb target group
#####################################

resource "aws_alb_target_group" "demo_aws_alb_target_group" {

  name            = var.aws_alb_target_group_name
  port            = var.aws_alb_target_group_name_port
  protocol        = var.aws_alb_target_group_name_protocol
  vpc_id          = data.aws_vpc.default.id
}

#####################################
# alb resource
#####################################

resource "aws_alb" "demo_aws_alb" {
  name                        = var.aws_alb_name
  internal                    = false
  load_balancer_type          = var.aws_alb_load_balancer_type
  security_groups             = [aws_security_group.demosg1.id]
  enable_deletion_protection  = false
  #subnets                     = [local.subnet_ids_list[0],local.subnet_ids_list[1]]
  subnets                     = var.aws_alb_public_subnet
  tags                        = var.tags
}

#####################################
# alb listener
#####################################

resource "aws_lb_listener" "demo_aws_lb_listener" {
  load_balancer_arn = aws_alb.demo_aws_alb.arn
  port              = var.aws_alb_target_group_name_port
  protocol          = var.aws_alb_target_group_name_protocol

  default_action {
    type              = "forward"
    target_group_arn  = aws_alb_target_group.demo_aws_alb_target_group.arn
  }
}
