provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "Docker_Server_ec2" {
  ami = "ami-05bfbece1ed5beb54"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.Docker_SG.id ]
  key_name = "devops-key"
  user_data = file("server-script.sh")
  associate_public_ip_address = true

  tags = {
    Name = "Docker Server"

  }
}


output "privateIP" {
  value = aws_instance.Docker_Server_ec2.private_ip
}





variable "ingressrules" {
  type = list(number)
  default = [ 80,443,8080,22,8081 ]
}

variable "egressrules" {
  type = list(number)
  default = [ 80,443,8080,22,8081 ]
}


resource "aws_security_group" "Docker_SG" {
  name = "Docker security group"

dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

dynamic "egress" {
      iterator = port
      for_each = var.egressrules
      content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      }
  } 
}