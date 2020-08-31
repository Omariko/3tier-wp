variable "vpc_name" {
    type = string
    default = "omar-vpc"
    description = "VPC Name"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "VPC CIDR Block"
}

variable "private_subnet_cidr" {
    type = list
    default = ["10.0.0.0/24","10.0.1.0/24"]
    description = "Private Subnet CIDR Block"
}

variable "public_subnet_cidr" {
    type = list
    default = ["10.0.100.0/24","10.0.101.0/24"]
    description = "Public Subnet CIDR Block"
}

variable "environment" {
    type = string
    default = "Dev"
    description = "Environment Name"
}

variable "db_name" {
    type = string
    default = "wordpress"
    description = "Database Name"
}

variable "db_username" {
    type = string
    default = "omar"
    description = "Database User Name"
}

variable "db_password" {
    type = string
    default = "Welcome2WP"
    description = "Database Password"
}

variable "asg_name_prefix" {
    type = string
    default = "wp-"
    description = "Name Prefix"
}
variable "db_port" {
    type = string
    default = "3306"
    description = "Database port"
}

variable "db_maintenance_window" {
    type = string
    default = "Mon:00:00-Mon:03:00"
    description = "Database Maintenance Window"
}

variable "db_backup_window" {
    type = string
    default = "03:00-06:00"
    description = "Database Backup Window"
}

variable "db_instance_type" {
    type = string
    default = "db.t3.micro"
    description = "Database Instance Type"
}

variable "group" {
    type = string
    default = "dev"
    description = "Group Name for Tags"
}

variable "app_sg_name" {
    type = string
    default =" wp_sg"
    description = "Application Security Group"
}

variable "app_instance_type" {
    type = string
    default = "t3.micro"
    description = "Application Instance Type"
}

variable "app_port" {
    type = string
    default = "80"
    description = "Application Port"
}

variable "app_autoscale_min_size" {
    type = string
    default = "1"
    description = "Autoscale Min Size"
}

variable "app_autoscale_max_size" {
    type = string
    default = "1"
    description = "Autoscale Max Size"
}

variable "azs" {
    type = list
    default = ["us-east-1a", "us-east-1b"]
    description = "AWS AZs"
}

variable "aws_ami" {
    type = string
    default = "ami-0bcc094591f354be2"
    description = "AWS AMI Name"
}

variable "key_pair" {
    type = string
    default = "omar"
    description = "AWS EC2 Key Pair Name"
}

variable "alb_name" {
    type = string
    default = "wp-alb"
    description = "Application Loadbalancer"
}

variable "app_elb_health_check_interval" {
  description = "Duration between health checks"
  default = 20
}

variable "app_elb_healthy_threshold" {
  description = "Number of checks before an instance is declared healthy"
  default = 2
}

variable "app_elb_unhealthy_threshold" {
  description = "Number of checks before an instance is declared unhealthy"
  default = 2
}

variable "app_elb_health_check_timeout" {
  description = "Interval between checks"
  default = 5
}

variable "public_key" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDm5jbtqziynjGt37/dnv+1Gv4Fm2k+s6mPKhk6OpU64vprN/mDoH3B7cMV5t6cV+hQrg81bZ4rPR/TbCuBCelhZW8PdeBrKIUcydZwxBz3hokAPZyRH3HaypR1ipehcCmJD0dUMgfbTebxqG4g4JgrD8EUbpO0vGDZ+JKTW3a2/vlCBRCrAvAsvnezuDn/+aGersieAKqP9FHtGHVO6P8w6SjEamTKahYzohBDpZ9G+FRk1mfxjCzu3jUF351rvjoYCHHr8kSMHCJLJI5m7gx25ktiidNiUrydx4x1CjopJlGhUpC7sV5IQE4DQfkt6T1d1XOF61th7qYZzSM5RbdoSTSvYtdUqfTjwrACZw8KYrEy00MgbZpFkMuC9D0empiwPAKD1qbHBxKIFWOwoIg/jNwHRv9BfTMwDHWGwjvnHwqZzPOvhZPpY9ZghR8lqjJF6LsrgDd93e94l6Ex8YrsfVOCcKo6d8QZQCuCwiITg0xStrtVue5MnXrqgzHmLp0= omar"
    description = "SSH Public Key"
}