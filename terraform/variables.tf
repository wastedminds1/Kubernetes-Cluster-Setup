variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  default     = "portfolio-cluster"
}

variable "master_instance_type" {
  description = "EC2 instance type for master nodes"
  default     = "t2.micro"
}

variable "worker_instance_type" {
  description = "EC2 instance type for worker nodes"
  default     = "t2.micro"
}

variable "node_count" {
  description = "Number of worker nodes"
  default     = 2
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair to use"
  default     = "k8s-cluster-key"
}