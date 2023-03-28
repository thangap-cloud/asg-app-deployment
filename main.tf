#####################################
# iam instance role
#####################################
resource "aws_iam_role" "aws_demo_instance_role" {
  name      = "demo-asg-instance-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

 tags = var.tags
}

#####################################
# iam role policy
#####################################

resource "aws_iam_role_policy" "test_policy" {
  name = var.aws_iam_role_policy_name
  role = aws_iam_role.aws_demo_instance_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#####################################
# iam instance profile creation
#####################################

resource "aws_iam_instance_profile" "test_profile" {
  name = var.aws_iam_instance_profile_name
  role = aws_iam_role.aws_demo_instance_role.name
}

#####################################
# Security Group
#####################################

resource "aws_security_group" "demosg1" {
  name        = var.aws_security_group_name
  description = var.aws_security_group_desc
  vpc_id      = data.aws_vpc.default.id
  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#####################################
# ASG Launch configuration
#####################################

resource "aws_launch_configuration" "aws-asg-lc" {
  name_prefix                       = var.aws-asg-name
  image_id                          = var.aws-asg-image-id
  instance_type                     = var.aws-asg-instance-type
  security_groups                   = [aws_security_group.demosg1.id]
  associate_public_ip_address       = "false"
  user_data                         = data.template_file.user_data.rendered
  iam_instance_profile              = aws_iam_instance_profile.test_profile.name

  lifecycle {
    create_before_destroy = true
  }
  root_block_device {
    volume_type = var.aws-asg-volume-type
    volume_size = var.aws-asg-volume-size
  }
}

#####################################
# Auto Scaling Group
#####################################

resource "aws_autoscaling_group" "demo-asg" {
  name                            = "demo-asg-group"
  launch_configuration            = aws_launch_configuration.aws-asg-lc.id
  desired_capacity                = var.aws-asg-desired_capacity
  max_size                        = var.aws-asg-group-max-size
  min_size                        = var.aws-asg-group-min-size
  vpc_zone_identifier             = [aws_subnet.aws-asg-private-sn.id]
  target_group_arns               = [aws_alb_target_group.demo_aws_alb_target_group.arn]
  depends_on                      = [aws_alb.demo_aws_alb,aws_alb_target_group.demo_aws_alb_target_group,aws_s3_bucket.demo_s3_bucket,aws_nat_gateway.demo-nat]
}

#####################################
# outputs
#####################################

output "alb-url" {
  value = aws_alb.demo_aws_alb.dns_name
}

output "s3-external-ep" {
  value = aws_s3_access_point.external.arn
}