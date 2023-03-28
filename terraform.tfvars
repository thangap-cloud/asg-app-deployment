tags                                = {Env="Demo",CreatedBy="TF",App="MyApp" }
aws-eks-private-key-name            = "aws-eks-bastion-key"

aws-asg-name                        = "aws-eks-jumphost"
aws-asg-image-id                    = "ami-0bf97847fcd5c9f57"
aws-asg-instance-type               = "t2.micro"

aws-asg-sg-name                     = "demo-asg-sg"
aws-alb-sg-name                     = "demo-alb-sg"
aws-alb-sg-description              = "demo alb"
aws-asg-sg-description              = "demo-asg-sg"
aws_alb_target_group_name           = "demo-alb-target-group"
aws_alb_target_group_name_port      = "80"
aws_alb_target_group_name_protocol  = "HTTP"
aws_alb_public_subnet               = ["subnet-035a595bdbd29c139","subnet-0ec6c15145ae015d1"]
aws_nat_gw_public_sn                = "subnet-035a595bdbd29c139"

aws_s3_bucket_name  = "thangap0034789-demo-s3"

