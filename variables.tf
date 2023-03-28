variable "aws-priv-subnet-cidr" {
  type = string
  default = "172.31.96.0/20"
}

variable "aws-priv-sn-az" {
  type = string
  default = "ap-southeast-1a"
}

variable "aws-asg-name" {
  type = string
  default = ""
}

variable "aws-asg-image-id" {
  type = string
  default = ""
}

variable "aws-asg-instance-type" {
  type = string
  default = "t2.micro"
}

variable "aws-asg-configuration-key-name" {
  type = string
  default = ""
}

variable "aws-asg-user-data" {
  type = string
  default = ""
}

variable "aws-asg-volume-type" {
  type = string
  default = "gp2"
}

variable "aws-asg-volume-size" {
  type = string
  default = "50"
}

variable "aws-asg-desired_capacity" {
  type = string
  default = "3"
}

variable "aws-asg-group-max-size" {
  type = string
  default = "3"
}

variable "aws-asg-group-min-size" {
  type = string
  default = "3"
}

variable "aws-asg-sg-name" {
  type = string
  default = ""
}

variable "aws-asg-sg-description" {
  type = string
  default = ""
}

variable "aws-alb-sg-name" {
  type = string
  default = ""
}

variable "aws-alb-sg-description" {
  type = string
  default = ""
}

variable "aws_alb_target_group_name" {
  type = string
  default = ""
}

variable "aws_alb_target_group_name_port" {
  type = number
  default = 80
}

variable "aws_alb_target_group_name_protocol" {
  type = string
  default = ""
}

variable "aws_alb_target_group_health_check" {
  type  = map(any)
  default = {}
}

variable "aws_alb_name" {
  type  = string
  default = ""
}

variable "aws_alb_load_balancer_type" {
  type = string
  default ="application"
}

variable "aws_s3_bucket_name" {
  type    = string
  default = ""
}

variable "aws_iam_role_policy_name" {
  type = string
  default = "demo-iam-role"
}

variable "aws_iam_instance_profile_name" {
  type = string
  default = "demo-instance-profile"
}

variable "aws_security_group_name" {
  type = string
  default = "demo-sg"
}

variable "aws_security_group_desc" {
  type  = string
  default = "demo-sg-demo"
}
variable "aws_alb_public_subnet" {
  type = list(any)
  default = []
}

variable "aws_nat_gw_public_sn" {
  type = string
  default = ""
}
variable "tags" {
  type    = map(any)
  default = {}
}