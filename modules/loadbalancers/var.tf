variable "pub_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "priv_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "nginx_security_group" {
  description = "Security group for Nginx instances"
  type        = string
}

variable "apache_security_group" {
  description = "Security group for Apache instances"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "nginx_instance_ids" {
  description = "Nginx instance IDs"
  type        = list(string)
}

variable "apache_instance_ids" {
  description = "Apache instance IDs"
  type        = list(string)
}

