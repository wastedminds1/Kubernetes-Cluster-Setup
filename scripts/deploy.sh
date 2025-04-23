#!/bin/bash

set -e

# Initialize and apply Terraform
echo "Initializing Terraform..."
cd terraform
terraform init

echo "Applying Terraform configuration..."
terraform apply -auto-approve

# Get outputs from Terraform
MASTER_IP=$(terraform output -raw master_public_ip)
WORKER_IPS=$(terraform output -json worker_public_ips | jq -r '.[]')

# Generate Ansible inventory
echo "Generating Ansible inventory..."
cat > ../ansible/inventory.ini <<EOF
[master]
$MASTER_IP ansible_user=ubuntu

[workers]
EOF

for IP in $WORKER_IPS; do
  echo "$IP ansible_user=ubuntu" >> ../ansible/inventory.ini
done

echo "[kube_cluster:children]" >> ../ansible/inventory.ini
echo "master" >> ../ansible/inventory.ini
echo "workers" >> ../ansible/inventory.ini

# Run Ansible playbook
echo "Running Ansible playbook..."
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml

echo "Kubernetes cluster deployment complete!"
echo "Master node: $MASTER_IP"
echo "Worker nodes:"
for IP in $WORKER_IPS; do
  echo "- $IP"
done