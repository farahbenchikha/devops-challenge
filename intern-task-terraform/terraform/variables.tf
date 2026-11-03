variable "aws_region" {
  description = "AWS region in which to provision the infrastructure."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix applied to created AWS resources."
  type        = string
  default     = "intern-task-app"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the public subnet."
  type        = string
  default     = "us-east-1a"
}

variable "ami_id" {
  description = "Ubuntu 24.04 LTS AMI ID used for the EC2 instance."
  type        = string
  default     = "ami-0e86e20dae9224db8"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "app_port" {
  description = "Port on which intern-task-app listens inside the container and on the host."
  type        = number
  default     = 5000
}

variable "admin_username" {
  description = "Non-root system user created via cloud-init with passwordless sudo."
  type        = string
  default     = "devops"
}

variable "ssh_allowed_cidr" {
  description = "Specific CIDR block allowed to SSH into the instance (e.g. 203.0.113.10/32). Must not be 0.0.0.0/0."
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0)) && var.ssh_allowed_cidr != "0.0.0.0/0" && var.ssh_allowed_cidr != "::/0"
    error_message = "ssh_allowed_cidr must be a valid CIDR block and must not be open to the world (0.0.0.0/0 or ::/0)."
  }
}