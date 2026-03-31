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

# Update system
sudo yum update -y

# Install Java + wget
sudo yum install -y java-17-openjdk wget

# Add Jenkins repo
sudo curl -o /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo yum install -y jenkins

# Start Jenkins
sudo systemctl daemon-reexec
sudo systemctl start jenkins
sudo systemctl enable jenkins
EOF
  tags = {
    Name = "Jenkins"
  }
}