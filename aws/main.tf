provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "LearningVPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "LearningIGW"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/25"

  tags = {
    Name = "MainSubnet"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main.id
  key_name = "learning"

  tags = {
    Name = "LearningEC2"
  }
}
output "ec2_ip" {
  value = aws_instance.web.public_ip
}
