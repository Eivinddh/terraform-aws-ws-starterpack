resource "aws_s3_bucket" "server-asset" {
  bucket = "group-4-server-asset"
  tags = {
    Name        = "Server asset"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "host" {
  bucket = "group-4-host"
  tags = {
    Name        = "Host"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "asset_policy" {
    bucket = aws_s3_bucket.server-asset.id
    policy = templatefile("${path.module}/policy/public_bucket.json.tpl", { bucket_arn = aws_s3_bucket.server-asset.arn})
}

resource "aws_s3_bucket_policy" "host_policy" {
    bucket = aws_s3_bucket.host.id
    policy = templatefile("${path.module}/policy/public_bucket.json.tpl", { bucket_arn = aws_s3_bucket.host.arn})
}