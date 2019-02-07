variable "aws_access_key" {
default = "AKIAIWNNT64WNI2RHKEQ"
}
variable "aws_secret_key" {
default = "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"
}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS"{
type = "map"
default = {
us-east-1 = "ami-6871a115"
ap-southeast-1 = "ami-76144b0a"
ap-south-1 = "ami-5b673c34"
 }
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "/home/sample/vpc/vasu"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "/home/sample/vpc/vasu.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}






