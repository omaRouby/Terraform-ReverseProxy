variable "pub_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "priv_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "nginx_ami" {
  description = "AMI ID for Nginx EC2 instances"
}

variable "apache_ami" {
  description = "AMI ID for Apache EC2 instances"
}

variable "nginx_instance_user_data" {
  description = "User data for Nginx EC2 instances"
  type        = string
  default     = "./userdata/nginx_user_data.sh"
}

variable "apache_instance_user_data" {
  description = "User data for Apache EC2 instances"
  type        = string
  default     = "./userdata/apache_user_data.sh"
}

variable "priv_lb_dns" {
  description = "DNS name of the private load balancer"
  type        = string
}

variable "nginx_security_group" {
  description = "Security group for Nginx instances"
  type        = string
}

variable "apache_security_group" {
  description = "Security group for Apache instances"
  type        = string
}
