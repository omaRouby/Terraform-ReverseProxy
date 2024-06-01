variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
}

variable "pub_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "priv_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

