provider "aws" {
  region  = "eu-west-2"
  profile = "mayo_cli"
}


data "aws_s3_bucket" "flask_app_bucket" {
  bucket = "flask-app-mayowa-bucket"
}

data "aws_s3_object" "flask_app_object" {
  bucket = "flask-app-mayowa-bucket"
  key    = "beanstalk/bid-flask.zip"
}

resource "aws_elastic_beanstalk_application" "bidchallenge" {
  name        = "bidchallenge"
  description = "bidnamic flask app challenge"
}

resource "aws_elastic_beanstalk_application_version" "bidchallenge_version" {
  bucket      = data.aws_s3_bucket.flask_app_bucket.id
  key         = data.aws_s3_object.flask_app_object.key
  application = aws_elastic_beanstalk_application.bidchallenge.name
  name        = "bidchallenge"

}

resource "aws_elastic_beanstalk_environment" "flask_app" {

  name                = "flaskapp"
  application         = aws_elastic_beanstalk_application.bidchallenge.name
  solution_stack_name = "64bit Amazon Linux 2 v3.3.10 running Python 3.7"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

 setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }
 

}

