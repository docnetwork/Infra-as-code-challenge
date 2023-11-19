# resource "aws_instance" "DocNetwork" {
#   ami               = data.aws_ami.my-ami.id
#   instance_type     = var.ec2_instance_type
#   availability_zone = var.availability_zone
#   monitoring        = true
#   subnet_id         = aws_subnet.us-west-2-subnet-main[0].id

#   tags = local.tags
# }

resource "aws_autoscaling_group" "autoscale-us-west" {
  availability_zones = [var.availability_zone, var.alt_availability_zone]
  capacity_rebalance = false
  default_cooldown   = 420
  desired_capacity   = 2
  enabled_metrics = [
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
  force_delete              = false
  health_check_grace_period = 420
  health_check_type         = "EC2"
  load_balancers            = [aws_lb.elb-us-west.name]
  max_instance_lifetime     = 0
  max_size                  = 4
  metrics_granularity       = "1Minute"
  min_size                  = 2
  name                      = "asg${local.name_suffix}"
  protect_from_scale_in     = false
  service_linked_role_arn   = "AWSServiceRoleForElasticLoadBalancing"
  suspended_processes       = []
  target_group_arns         = [aws_lb_target_group.lb-target-us-west.arn]
  wait_for_capacity_timeout = "10m"
  termination_policies = [
    "OldestInstance",
  ]

  tag {
    key                 = "Application"
    value               = lookup(local.tags, "Application")
    propagate_at_launch = true
  }


  launch_template {
    id      = aws_launch_template.dn-lc-prod-app.id
    version = "$Latest"
  }

  timeouts {}
}

# Elastic Load Balancing (ELB) v.2 
resource "aws_lb" "elb-us-west" {
  name                       = "elb${local.name_suffix}"
  load_balancer_type         = "application"
  internal                   = false
  enable_deletion_protection = true
  subnets                    = values(aws_subnet.us-west-2-subnet-main)[*].id
  security_groups            = ["sg-04bdbc229096d2046", "sg-091ab7d5cbc65b6be"]
}

resource "aws_lb_target_group" "lb-target-us-west" {
  name                 = "lbtg${local.name_suffix}"
  port                 = "80"
  protocol             = "HTTP"
  vpc_id               = aws_vpc.us-west-2-vpc-main.id
  target_type          = "instance"
  deregistration_delay = "120"
  slow_start           = "0"
  tags                 = local.tags
  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/ping"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 7
    interval            = 10
    matcher             = "200"
  }
}

# Load Balancer Listeners. 
resource "aws_alb_listener" "lb-listener-us-west" {
  port              = "80"
  protocol          = "HTTP"
  load_balancer_arn = aws_lb.elb-us-west.arn
  default_action {
    target_group_arn = aws_lb_target_group.lb-target-us-west.arn
    type             = "forward"
  }
}

# You can use either Launch Configuration or Launch Template here. 
resource "aws_launch_template" "dn-lc-prod-app" {
  name_prefix   = "west-staging"
  instance_type = "c4.xlarge"
  image_id      = "ami-019f81013c7a9ea53"
  key_name      = "ec2${local.name_suffix}"

  network_interfaces {
    security_groups = ["sg-04bdbc229096d2046", "sg-091ab7d5cbc65b6be"]
  }

  iam_instance_profile {
    name = "ecsInstanceRole"
  }

  user_data = <<EOF
		#!/bin/bash

			# Update apt repositories
			sudo yum update -y

			# Set the environment variable for the ecs-agent
			echo "ECS_CLUSTER=challenge" > /etc/ecs/ecs.config
			EOF
}