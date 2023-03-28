# demo-cloud-nsearch

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


