data "template_file" "user_data" {
template = file("${path.module}/user-data.sh")

vars = {
  s3_external_endpoint = aws_s3_access_point.external.arn
}
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "subnet-ids" {
  vpc_id = data.aws_vpc.default.id

}