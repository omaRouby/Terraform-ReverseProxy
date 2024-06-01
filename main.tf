provider "aws" {
  region = var.region
}

module "networking" {
  source  = "./modules/networking"
  vpc_cidr_block = var.vpc_cidr_block
  pub_subnet_cidr_blocks = var.pub_subnet_cidr_blocks
  priv_subnet_cidr_blocks = var.priv_subnet_cidr_blocks
  availability_zones  = var.availability_zones
}

module "loadbalancers" {
  source = "./modules/loadbalancers"
  pub_subnets = module.networking.pub_subnets
  priv_subnets = module.networking.priv_subnets
  nginx_security_group = module.networking.nginx_sg_id
  apache_security_group = module.networking.apache_sg_id
  vpc_id = module.networking.vpc_id
  nginx_instance_ids = module.ec2s.nginx_instance_ids
  apache_instance_ids = module.ec2s.apache_instance_ids
  
}


module "ec2s" {
  source = "./modules/ec2s"
  pub_subnets = module.networking.pub_subnets
  priv_subnets = module.networking.priv_subnets
  nginx_ami = var.nginx_ami
  apache_ami = var.apache_ami
  priv_lb_dns = module.loadbalancers.priv_lb_dns
  nginx_security_group = module.networking.nginx_sg_id
  apache_security_group = module.networking.apache_sg_id
}




output "pub_lb_dns" {
  value = module.loadbalancers.pub_lb_dns
}

output "priv_lb_dns" {
  value = module.loadbalancers.priv_lb_dns
}

