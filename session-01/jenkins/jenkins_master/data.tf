data "aws_ami" "rhel" {
  most_recent = true

  owners = ["309956199498"] # Red Hat official AWS account

  filter {
    name   = "name"
    values = ["RHEL-9.*_HVM-*-x86_64-*"]
  }
}

data "aws_security_group" "allow_all" {
  id = "sg-06159e41f1b2c1aa3"
}