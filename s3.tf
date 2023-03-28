
resource "aws_s3_bucket" "demo_s3_bucket" {
  bucket              = var.aws_s3_bucket_name
  tags                = var.tags
}

resource "aws_s3_bucket_acl" "demo_aws_s3_bucket_acl" {
  bucket = aws_s3_bucket.demo_s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "demo_aws_s3_bucket_versioning" {
  bucket = aws_s3_bucket.demo_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "my_protected_bucket_access" {
  bucket = aws_s3_bucket.demo_s3_bucket.id

  # Block public access
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "object-src-folder" {
  for_each = fileset("${path.module}/src", "**/*")
  bucket = aws_s3_bucket.demo_s3_bucket.id
  key    = "/src/${each.value}"
  source = "${path.module}/src/${each.value}"
  acl     = "public-read-write"
}

resource "aws_s3_access_point" "external" {
  bucket = aws_s3_bucket.demo_s3_bucket.id
  name   = "demo-external-endpoint"
  public_access_block_configuration {
    block_public_acls   = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
  }
}

resource "aws_s3_access_point" "internal" {
  bucket = aws_s3_bucket.demo_s3_bucket.id
  name   = "demo-internal-endpoint"
  vpc_configuration {
    vpc_id = data.aws_vpc.default.id
  }

  public_access_block_configuration {
    block_public_acls   = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
  }

}