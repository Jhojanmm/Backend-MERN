terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
   }
 }
}
 
provider "aws" {
 region  = "us-east-1"
}
 
resource "aws_instance" "app_server" {
 ami           = "ami-0ff8a91507f77f867"
 instance_type = "t2.micro"
 
 security_groups = [aws_security_group.allow_ssh.name]
 # https://github.com/hashicorp/terraform-provider-aws/issues/23315
 user_data_replace_on_change = true
 
 tags = {
   Name = "jmartinez748@soyudemedellin.edu.co"
 }
  user_data = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo docker pull nginx
    sudo docker run -d -p 80:80 nginx
 EOF
}
 
 
resource "aws_security_group" "allow_ssh" {
 name        = "allow_ssh-jmartinez748@soyudemedellin.edu.co"
 description = "Allow ssh inbound traffic"
 
 ingress {
   description      = "SSH from VPC"
   from_port        = 80
   to_port          = 80
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
 }
 
 egress {
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
 }
 
 tags = {
   Name = "allow_ssh"
 }
}
