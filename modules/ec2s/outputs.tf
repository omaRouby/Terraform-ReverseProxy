output "nginx_instance_ids" {
  value = aws_instance.nginx[*].id
}

output "apache_instance_ids" {
  value = aws_instance.apache[*].id
}

