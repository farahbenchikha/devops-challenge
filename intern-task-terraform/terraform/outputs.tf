output "instance_public_ip" {
  description = "Public IPv4 address of the EC2 instance running intern-task-app."
  value       = aws_instance.app.public_ip
}

output "app_port" {
  description = "TCP port on which intern-task-app listens."
  value       = var.app_port
}