provider "aws" {
  region  = "us-east-1"
}

resource "aws_vpc" "jcsvpc" {
  cidr_block       = "10.0.0.0/24"

  tags = {
    Name = "jcstestvpc"
  }
}

resource "aws_internet_gateway" "jcs_igw" {
  vpc_id = aws_vpc.jcsvpc.id

  tags = {
    Name = "jcstestigw"
  }
}

resource "aws_subnet" "jcs_subnet" {
  vpc_id     = aws_vpc.jcsvpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "jcstestsubnet"
  }
}

resource "aws_instance" "jcs_ec2" {
  ami           = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  subnet_id   = aws_subnet.jcs_subnet.id

  tags = {
    Name = "jcstestec2"
  }
}

resource "aws_key_pair" "jithin" {
  key_name   = "jithin-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnApqM+pjvFFm85ICjWMFapLLmGaJPelPvE4Eit+YUiKHhwk8g033DNAKLPk6dPRIMN3U2Mg9zB/rM5fwfS98OeRW7GqSQGZVssiwTMdUfTpb+rgD/PDs1I+YdHIus8+/sDGQQ5F2FOukUyg7w9bHtwTMj8OV2uNWMCwr96g8EEwnykB3pO8OYq3jVpmZWWrItruqdgRUo+H+2LpTvZW1GphZ7MQGF3DJSQawePOKvQk0oFH3+XIwdNHwv1iFx0lbopROPotgHIf15gbir3jhIkwql+JisZr/z0qJBSutHZ74fHgfYmho5ljnE9zdp4bfTl+r1pz6e5xgSZ7sZGxap jithin@jithin-pirai"
}

output "ec2_ip" {
  value = aws_instance.jcs_ec2.public_ip
}
