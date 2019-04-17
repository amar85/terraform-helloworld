# Create an application in Elastic Beanstalk. 
resource "aws_elastic_beanstalk_application" "demo-express" {
  name        = "${var.app_name}"
  description = "Node Express application"
}

# Provides an Elastic Beanstalk Configuration Template, which are associated with a 
# specific application and are used to deploy different versions of the application 
# with the same configuration settings.
resource "aws_elastic_beanstalk_configuration_template" "tf_template" {
  name                = "tf-test-template-config"
  application         = "${aws_elastic_beanstalk_application.demo-express.name}"
  solution_stack_name = "${var.stack_name}"
}

# Create ELastic Beanstalk environment like: development, integration, or production.
resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name          = "${var.dev_env}"
  application   = "${aws_elastic_beanstalk_application.demo-express.name}"
  template_name = "${aws_elastic_beanstalk_configuration_template.tf_template.name}"
}

# Provides a S3 bucket resource.
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket}"
}

# Provides a S3 bucket object resource.
resource "aws_s3_bucket_object" "bucketObject" {
  bucket = "${aws_s3_bucket.bucket.id}"

  # The name of the object once it is in the bucket.
  key = ""

  # The path to a file that will be read and uploaded as raw bytes for the object content.
  source = ""
}

# Create a Beanstalk Application Version that can be deployed to a Beanstalk Environment.
resource "aws_elastic_beanstalk_application_version" "node-expressV1" {
  name        = "node-expressV1"
  application = "${aws_elastic_beanstalk_application.demo-express.id}"
  description = "application version created by terraform"
  bucket      = "${aws_s3_bucket.bucket.id}"
  key         = "${aws_s3_bucket_object.bucketObject.id}"
}
