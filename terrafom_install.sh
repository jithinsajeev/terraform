#! /bin/bash

cd /tmp
wget wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip terraform_0.12.24_linux_amd64.zip
# Copy terraform file to /usr/bin to run as command. 
cp terraform /usr/bin/ 
