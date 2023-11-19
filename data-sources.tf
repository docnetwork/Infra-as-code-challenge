data "aws_region" "current" {}

data "aws_ami" "my-ami" {
  executable_users = ["self"]
  most_recent      = true
}