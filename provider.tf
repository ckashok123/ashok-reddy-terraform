provider "aws" {
  version = "1.1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "us-east-1"
}
