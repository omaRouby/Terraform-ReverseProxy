output "pub_subnets" {
  value = aws_subnet.public[*].id
}

output "priv_subnets" {
  value = aws_subnet.private[*].id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
output "nginx_sg_id" {
  value = aws_security_group.nginx_sg.id
}

output "apache_sg_id" {
  value = aws_security_group.apache_sg.id
}


