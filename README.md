# Kubernetes Cluster Automation with Terraform and Ansible

This project automates the deployment of a Kubernetes cluster on AWS using Terraform for infrastructure provisioning and Ansible for configuration management.

## Features

- Automated provisioning of AWS resources (VPC, EC2 instances, security groups)
- Configuration of Kubernetes master and worker nodes
- Flannel CNI plugin installation
- Idempotent deployment with Terraform and Ansible

## Prerequisites

- AWS account with IAM credentials
- Terraform installed
- Ansible installed
- AWS CLI configured
- jq installed (for JSON parsing)

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/wastedminds1/kubernetes-cluster-automation.git
   cd kubernetes-cluster-automation