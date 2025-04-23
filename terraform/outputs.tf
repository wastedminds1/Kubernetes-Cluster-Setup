output "master_public_ip" {
  value = aws_instance.master.public_ip
}

output "worker_public_ips" {
  value = aws_instance.workers[*].public_ip
}

output "cluster_name" {
  value = var.cluster_name
}