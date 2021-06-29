resource "aws_autoscaling_group" "" {
  availability_zones = [ ]
  capacity_rebalance = false
  default_cooldown   = 420
  desired_capacity   = 
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
  launch_configuration      = ""
  load_balancers            = []
  max_instance_lifetime     = 0
  max_size                  = 
  metrics_granularity       = ""
  min_size                  = 
  name                      = ""
  protect_from_scale_in     = false
  service_linked_role_arn   = ""
  suspended_processes       = []
  target_group_arns = [
    "",
  ]
  wait_for_capacity_timeout = "10m"
  termination_policies = [
    "OldestInstance",
  ]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = ""
  }

  timeouts {}
}

# Elastic Load Balancing (ELB) v.2 
resource "aws_lb" "" {
	name                       = ""
	load_balancer_type         = ""
	internal                   = false
	enable_deletion_protection = true
	subnets                    = 
	security_groups            = [""]
}

resource "aws_lb_target_group" "" {
	name                 = ""
	port                 = "80"
	protocol             = ""
	vpc_id               = ""
	target_type          = "instance"
	deregistration_delay = "120"
	slow_start           = "0"
	tags = {
		name = ""
	}
	health_check {
		enabled             = true
		protocol            = ""
		path                = "/ping"
		healthy_threshold   = 5
		unhealthy_threshold = 2
		timeout             = 7
		interval            = 10
		matcher             = "200"
	}
}

# Load Balancer Listeners. 
resource "aws_alb_listener" "" {
	port              = ""
	protocol	= "HTTP"
	load_balancer_arn = ""
	default_action {
		target_group_arn = ""
		type             = "forward"
	}
}

# You can use either Launch Configuration or Launch Template here. 
resource "aws_launch_configuration" "dn-lc-prod-app" {
	name_prefix = "west-staging"
	instance_type = "c4.xlarge"
	image_id = "ami-019f81013c7a9ea53"
	key_name = "${var.key_pair_name}"
	security_groups = ["sg-04bdbc229096d2046", "sg-091ab7d5cbc65b6be"]
	iam_instance_profile = "ecsInstanceRole"

 	 lifecycle {
    	create_before_destroy = true
  		}

	user_data = <<EOF
		#!/bin/bash

			# Update apt repositories
			sudo yum update -y

			# Set the environment variable for the ecs-agent
			echo "ECS_CLUSTER=challenge" > /etc/ecs/ecs.config
			EOF
}