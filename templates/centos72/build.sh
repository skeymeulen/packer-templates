#!/bin/bash
wget https://releases.hashicorp.com/packer/0.12.1/packer_0.12.1_linux_amd64.zip
unzip packer_0.12.1_linux_amd64.zip
export PACKER_LOG=1
./packer build template.json