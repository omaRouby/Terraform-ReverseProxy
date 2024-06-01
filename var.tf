variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default = "10.0.0.0/16"
}

variable "pub_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default = ["10.0.2.0/24","10.0.3.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
variable "priv_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default = ["10.0.0.0/24","10.0.1.0/24"]
}

variable "nginx_ami" {
  description = "AMI ID for Nginx EC2 instances"
  default = "ami-04b70fa74e45c3917"
}


variable "apache_ami" {
  description = "AMI ID for Apache EC2 instances"
  default = "ami-04b70fa74e45c3917"
}

variable "instance_user_data" {
  description = "User data for EC2 instance"
  type        = string
  default = null
}