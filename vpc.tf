resource "aws_vpc" "" {
	cidr_block           = ""
	enable_dns_hostnames = true
	enable_dns_support   = true
	instance_tenancy     = "default"
	enable_classiclink_dns_support = true

	tags = {
		Name = ""
	}
}

resource "aws_internet_gateway" "us-west-2-igw" {
	vpc_id = "${aws_vpc.us-west-2-vpc-main.id}"
}

resource "aws_security_group" "dn-sg-usw2-apiservers" {
	name        = "dn-sg-usw2-apiservers"
	description = "api server ports"
	vpc_id      = "${aws_vpc.us-west-2-vpc-main.id}"

	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		security_groups = ["sg-015d95f6088e7413c"]
		description = "http traffic"
	}
	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "SSH"
	}
	ingress {
		security_groups = ["sg-015d95f6088e7413c"]
		from_port   = 443
		to_port     = 443
		protocol    = "tcp"
		description = "https traffic"
	}
	ingress {
		from_port   = 9100
		to_port     = 9101
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "Metrics Export"
	}
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
		egress {
		from_port       = 6379
		to_port         = 6379
		protocol        = "tcp"
		cidr_blocks     = ["0.0.0.0/0"]
		description     = "API Servers Connection"
	}
	tags = {
		Name = "dn-sg-usw2-apiservers"
	}
}

resource "aws_security_group" "" {
	name        = ""
	description = ""
	vpc_id      = ""

	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "http traffic"
	}
	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "SSH"
	}
	ingress {
		from_port   = 443
		to_port     = 443
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "https traffic"
	}	

	egress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		description = "HTTP traffic"
		security_groups = [""]
	}	
	egress {
		from_port   = 443
		to_port     = 443
		protocol    = "tcp"
		description = "HTTPS traffic"
		security_groups = ["${aws_security_group.dn-sg-usw2-apiservers.id}"]
		# security_groups = "${aws_security_group.dn-sg-usw2-apiservers.id}"
	}

	tags = {
		Name = ""
	}
}

# AWS Subnet Section
resource "aws_subnet" "" {
	vpc_id                  = ""
	cidr_block              = ""
	availability_zone       = ""
	map_public_ip_on_launch = true

	tags = {
		Name = ""
	}
}

