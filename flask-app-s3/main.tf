provider "aws" {
  region  = "eu-west-2"
  profile = "mayo_cli"
}


resource "aws_s3_bucket" "flask_app_bucket" {
  bucket = "flask-app-mayowa-bucket"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "flask app bucket"
  }
}

resource "aws_s3_bucket_acl" "flask_app_bucket_acl" {
  bucket = aws_s3_bucket.flask_app_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "flask_app_bucket" {
  bucket = aws_s3_bucket.flask_app_bucket.id

  block_public_acls       = false
  restrict_public_buckets = true
  block_public_policy     = false
}

resource "aws_s3_object" "flask_app_object" {
  key                    = "beanstalk/bid-flask.zip"
  bucket                 = aws_s3_bucket.flask_app_bucket.id
  source                 = "../bid-flask.zip"
  server_side_encryption = "AES256"
}
