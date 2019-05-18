#!/bin/bash

echo "Installing Ansible and Testing connection"

sudo apt update 
echo "y" | sudo apt install ansible
sudo chown -R ubuntu /etc/ansible
sudo cat << EOF > /etc/ansible/hosts
[kube]
54.255.138.223
[rancher]
EOF

ssh -i key.pem ubuntu@kubeworker02 'sudo apt update && sudo apt install python -y'

echo "Test Ansible Connection to hosts"

ansible -m ping all

