data "aws_ami" "rhel" {
  most_recent = true

  owners = ["309956199498"] # Red Hat official AWS account

  filter {
    name   = "name"
    values = ["RHEL-9.*_HVM-*-x86_64-*"]
  }
}