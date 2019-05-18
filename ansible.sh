#!/bin/bash

echo "Installing Ansible and Testing connection"

sudo apt update 
echo "y" | sudo apt install ansible
sudo chown -R ubuntu /etc/ansible
sudo cat << EOF > /etc/ansible/hosts
[aws]
slave1
EOF

ssh -i key.pem ubuntu@slave1 'sudo apt update && sudo apt install python -y'

echo "Test Ansible Connection to hosts"

ansible -m ping all

