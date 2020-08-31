resource "aws_key_pair" "wp_keypair" {
  key_name   = "omar"
  public_key = var.public_key
}

resource "aws_security_group" "app" {
  name = var.app_sg_name
  vpc_id = module.vpc.vpc_id
  
  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = module.vpc.public_subnets_cidr_blocks
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = module.vpc.public_subnets_cidr_blocks
  }

  egress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
  
  tags = {
    Group = var.group
  }
}

resource "aws_launch_configuration" "app" {
  image_id        = var.aws_ami
  instance_type   = var.app_instance_type
  security_groups = [aws_security_group.app.id]
  key_name = var.key_pair
  name_prefix = var.asg_name_prefix
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "app" {
  launch_configuration = aws_launch_configuration.app.id

  vpc_zone_identifier = module.vpc.public_subnets

  target_group_arns    = module.alb.target_group_arns
  health_check_type = "EC2"

  min_size = var.app_autoscale_min_size
  max_size = var.app_autoscale_max_size

  tag {
    key = "Group"
    value = var.group
    propagate_at_launch = true
  }

}