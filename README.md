# Terraform Project: Nginx Reverse Proxy with Apache Servers
![](https://github.com/omaRouby/Terraform-ReverseProxy/blob/main/pictures/Cloud%20Architecture.png)
## Overview

This project sets up a VPC with an infrastructure containing:
- A load balancer targeting two Nginx reverse proxy servers in two public subnets.
- The Nginx servers forwarding traffic to another load balancer.
- The second load balancer targeting two Apache servers in two private subnets.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Initialization](#initialization)
- [Plan](#plan)
- [Apply](#apply)
- [Destroy](#destroy)
- [The Resources From Console](#console)


## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account with appropriate permissions
- AWS CLI configured with your credentials

## Project Structure

```sh
└── Terraform-ReverseProxy
    ├── main.tf
    ├── modules
    │   ├── ec2s
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── var.tf
    │   ├── loadbalancers
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── var.tf
    │   └── networking
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── var.tf
    │
    └── var.tf
```

## Usage

### Initialization

To initialize the project and download the necessary providers and modules, run:

```bash
terraform init
```
### Plan

To create an execution plan showing what actions Terraform will take, run:
```bash
terraform plan

```
### Apply

To apply the changes required to reach the desired state of the configuration, run:
```bash
terraform apply

```
![]()

### Destroy

To destroy the infrastructure managed by Terraform, run:
```bash
terraform destroy

```
### The Resources From Console.
1. **instances**
   ![](https://github.com/omaRouby/Terraform-ReverseProxy/blob/main/pictures/instances.png)

2. **Load Balancer DNS**
   ![](https://github.com/omaRouby/Terraform-ReverseProxy/blob/main/pictures/lb-DNS-apache.png)

3. **Private Load Balancer Resource Map:**
  ![](https://github.com/omaRouby/Terraform-ReverseProxy/blob/main/pictures/priv-lb-resourcemap.png)
4. **Public Load Balancer Resource Map:**
   ![](https://github.com/omaRouby/Terraform-ReverseProxy/blob/main/pictures/pub-lb-resourcemap.png)
5. **Public Load Balancer Network Mapping:**
   ![](https://github.com/omaRouby/Terraform-ReverseProxy/blob/main/pictures/pub-lb-networkmapping.png)
6. **Private Load Balancer Network Mapping:**
    ![](https://github.com/omaRouby/Terraform-ReverseProxy/blob/main/pictures/priv-lb-networkmapping.png)
 

