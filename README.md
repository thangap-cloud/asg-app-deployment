# Demo to deploy a js application to asg

This demo tf project creates you a private sn, asg, s3, alb and upload files under src, output will be the alb endpoint
please use the alb endpoint to access the application

The application deployed is a simple counter js application, source code for the file is located under src

## Getting started

```
git clone git@gitlab.com:cloud5680312/demo-cloud-nsearch.git
cd demo-cloud-nsearch
terraform init
terraform plan -out tf.plan
terraform apply "tf.plan"
```

## To Consider

I took subnet ids in a list and used it in runtime, if it's not working for you please update the subnet ids as required in terraform.tfvars

aws_alb_public_subnet               = ["subnet-035a595bdbd29c139","subnet-0ec6c15145ae015d1"]
aws_nat_gw_public_sn                = "subnet-035a595bdbd29c139"

## Outputs for CI/CD

please copy the output of s3-external-ep to be used for CI/CD

## Further improvements
SSL Certs to ALB, create a R53 domain, enable WAF

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.21.0 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb.demo_aws_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb) | resource |
| [aws_alb_target_group.demo_aws_alb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_autoscaling_group.demo-asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_eip.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_instance_profile.test_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.aws_demo_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.test_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_launch_configuration.aws-asg-lc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_lb_listener.demo_aws_lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_nat_gateway.demo-nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.nat-route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_s3_access_point.external](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_access_point) | resource |
| [aws_s3_access_point.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_access_point) | resource |
| [aws_s3_bucket.demo_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.demo_aws_s3_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_public_access_block.my_protected_bucket_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.demo_aws_s3_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_object.object-src-folder](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_security_group.demosg1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.aws-asg-private-sn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet_ids.subnet-ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [template_file.user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-alb-sg-description"></a> [aws-alb-sg-description](#input\_aws-alb-sg-description) | n/a | `string` | `""` | no |
| <a name="input_aws-alb-sg-name"></a> [aws-alb-sg-name](#input\_aws-alb-sg-name) | n/a | `string` | `""` | no |
| <a name="input_aws-asg-configuration-key-name"></a> [aws-asg-configuration-key-name](#input\_aws-asg-configuration-key-name) | n/a | `string` | `""` | no |
| <a name="input_aws-asg-desired_capacity"></a> [aws-asg-desired\_capacity](#input\_aws-asg-desired\_capacity) | n/a | `string` | `"3"` | no |
| <a name="input_aws-asg-group-max-size"></a> [aws-asg-group-max-size](#input\_aws-asg-group-max-size) | n/a | `string` | `"3"` | no |
| <a name="input_aws-asg-group-min-size"></a> [aws-asg-group-min-size](#input\_aws-asg-group-min-size) | n/a | `string` | `"3"` | no |
| <a name="input_aws-asg-image-id"></a> [aws-asg-image-id](#input\_aws-asg-image-id) | n/a | `string` | `""` | no |
| <a name="input_aws-asg-instance-type"></a> [aws-asg-instance-type](#input\_aws-asg-instance-type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_aws-asg-name"></a> [aws-asg-name](#input\_aws-asg-name) | n/a | `string` | `""` | no |
| <a name="input_aws-asg-sg-description"></a> [aws-asg-sg-description](#input\_aws-asg-sg-description) | n/a | `string` | `""` | no |
| <a name="input_aws-asg-sg-name"></a> [aws-asg-sg-name](#input\_aws-asg-sg-name) | n/a | `string` | `""` | no |
| <a name="input_aws-asg-user-data"></a> [aws-asg-user-data](#input\_aws-asg-user-data) | n/a | `string` | `""` | no |
| <a name="input_aws-asg-volume-size"></a> [aws-asg-volume-size](#input\_aws-asg-volume-size) | n/a | `string` | `"50"` | no |
| <a name="input_aws-asg-volume-type"></a> [aws-asg-volume-type](#input\_aws-asg-volume-type) | n/a | `string` | `"gp2"` | no |
| <a name="input_aws-priv-sn-az"></a> [aws-priv-sn-az](#input\_aws-priv-sn-az) | n/a | `string` | `"ap-southeast-1a"` | no |
| <a name="input_aws-priv-subnet-cidr"></a> [aws-priv-subnet-cidr](#input\_aws-priv-subnet-cidr) | n/a | `string` | `"172.31.96.0/20"` | no |
| <a name="input_aws_alb_load_balancer_type"></a> [aws\_alb\_load\_balancer\_type](#input\_aws\_alb\_load\_balancer\_type) | n/a | `string` | `"application"` | no |
| <a name="input_aws_alb_name"></a> [aws\_alb\_name](#input\_aws\_alb\_name) | n/a | `string` | `""` | no |
| <a name="input_aws_alb_public_subnet"></a> [aws\_alb\_public\_subnet](#input\_aws\_alb\_public\_subnet) | n/a | `list(any)` | `[]` | no |
| <a name="input_aws_alb_target_group_health_check"></a> [aws\_alb\_target\_group\_health\_check](#input\_aws\_alb\_target\_group\_health\_check) | n/a | `map(any)` | `{}` | no |
| <a name="input_aws_alb_target_group_name"></a> [aws\_alb\_target\_group\_name](#input\_aws\_alb\_target\_group\_name) | n/a | `string` | `""` | no |
| <a name="input_aws_alb_target_group_name_port"></a> [aws\_alb\_target\_group\_name\_port](#input\_aws\_alb\_target\_group\_name\_port) | n/a | `number` | `80` | no |
| <a name="input_aws_alb_target_group_name_protocol"></a> [aws\_alb\_target\_group\_name\_protocol](#input\_aws\_alb\_target\_group\_name\_protocol) | n/a | `string` | `""` | no |
| <a name="input_aws_iam_instance_profile_name"></a> [aws\_iam\_instance\_profile\_name](#input\_aws\_iam\_instance\_profile\_name) | n/a | `string` | `"demo-instance-profile"` | no |
| <a name="input_aws_iam_role_policy_name"></a> [aws\_iam\_role\_policy\_name](#input\_aws\_iam\_role\_policy\_name) | n/a | `string` | `"demo-iam-role"` | no |
| <a name="input_aws_nat_gw_public_sn"></a> [aws\_nat\_gw\_public\_sn](#input\_aws\_nat\_gw\_public\_sn) | n/a | `string` | `""` | no |
| <a name="input_aws_s3_bucket_name"></a> [aws\_s3\_bucket\_name](#input\_aws\_s3\_bucket\_name) | n/a | `string` | `""` | no |
| <a name="input_aws_security_group_desc"></a> [aws\_security\_group\_desc](#input\_aws\_security\_group\_desc) | n/a | `string` | `"demo-sg-demo"` | no |
| <a name="input_aws_security_group_name"></a> [aws\_security\_group\_name](#input\_aws\_security\_group\_name) | n/a | `string` | `"demo-sg"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb-url"></a> [alb-url](#output\_alb-url) | n/a |
| <a name="output_s3-external-ep"></a> [s3-external-ep](#output\_s3-external-ep) | n/a |
