variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = "8080"
}

variable "app_name" {
  default = "demo-express"
}

variable "template_name" {
  default = "tf-test-template-config"
}

variable "stack_name" {
  default = "64bit Amazon Linux 2018.03 v4.8.2 running Node.js"
}

variable "dev_env" {
  default     = "dev_env"
  description = "Development environment"
}

variable "region" {
  default     = "us-west-1"
  description = "AWS Region"
}

variable "bucket" {
  default     = "test-bucket"
  description = "AWS S3 bucket name"
}
