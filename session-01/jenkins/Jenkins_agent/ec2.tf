resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.rhel.id
  instance_type = "t3.small"
  vpc_security_group_ids = [data.aws_security_group.allow_all.id] # this means list
  key_name = "Ayaansh-wrk-Mumbai"
  user_data = <<-EOF
                    #!/bin/bash
                    set -ex

                    # Log everything
                    exec > /var/log/user-data.log 2>&1

                    # Install minimal required packages
                    sudo yum install -y wget curl java-17-openjdk

                    # Add Jenkins repo
                    sudo curl -L -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

                    # Import key
                    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

                    sudo yum install git -y     
                    
                    EOF
  tags = {
    Name = "Jenkins Agent"
  }
}