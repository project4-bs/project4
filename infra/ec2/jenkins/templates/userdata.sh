#!/bin/bash
echo 'Hello' > hello.txt
sudo apt update -y
sudo apt install git curl -y
cd /home/ubuntu
git clone https://github.com/Lucas0828/aws-project.git
sudo chown -R ubuntu:ubuntu aws-project

cd /home/ubuntu/aws-project
chmod u+x install-docker.sh && sudo ./install-docker.sh
sudo docker compose up -d --build

