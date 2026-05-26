resource "aws_instance" "web" {
  ami           = data.aws_ami.rhel.id
  instance_type = "t3.medium"
  vpc_security_group_ids = [data.aws_security_group.allow_all.id] # this means list
  key_name = "prudhvi-key-mumbai"

  tags = {
    Name = "HelloTerraform"
  }
}

