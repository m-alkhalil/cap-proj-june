terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "Jenkins-Server" {
  ami           = "ami-0cd59ecaf368e5ccf" 
  instance_type = "t2.medium"               

  tags = {
    Name = "Jenkins-Server"
  }

  key_name      = "vreg-key"

  vpc_security_group_ids = ["sg-015935b857841bcc5"]

  subnet_id = "subnet-066d85d919ea55105" 

  associate_public_ip_address = true 

  #set a higher storage for the instance
  root_block_device {
    volume_size = 30  # 25 GB of storage for the root volume
    volume_type = "gp2"  # General Purpose SSD (GP2), change as needed
  }
}
output "instance_ip" {
  value = aws_instance.Jenkins-Server.public_ip
}

