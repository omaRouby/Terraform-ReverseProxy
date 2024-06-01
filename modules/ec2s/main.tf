resource "aws_instance" "nginx" {
  count         = length(var.pub_subnets)
  ami           = var.nginx_ami
  instance_type = "t2.micro"
  subnet_id     = var.pub_subnets[count.index]
  security_groups = [var.nginx_security_group]
  user_data     = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo cat > /etc/nginx/sites-enabled/default << EOL
server {
    listen 80 default_server;
    location / {
      proxy_pass http://${var.priv_lb_dns};
    }
}
  
EOL
sudo systemctl restart nginx
EOF
}



resource "aws_instance" "apache" {
  count         = length(var.priv_subnets)
  ami           = var.apache_ami
  instance_type = "t2.micro"
  subnet_id     = var.priv_subnets[count.index]
  security_groups = [var.apache_security_group]
  user_data     = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
systemctl restart apache2
EOF
}


