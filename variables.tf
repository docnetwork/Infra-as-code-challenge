# Creds
variable "access_key" {
  type        = string
  description = "AWS access key ID"
}

variable "secret_key" {
  type        = string
  description = "AWS access key secret"
}

# Common
variable "region" {
  type        = string
  description = "AWS region"
}

variable "short_region" {
  type        = string
  description = "AWS region code (short)"
}

variable "availability_zone" {
  type        = string
  description = "AWS availability zone"
  default     = "us-west-2a"
}

variable "alt_availability_zone" {
  type        = string
  description = "AWS alternate availability zone"
  default     = "us-west-2b"
}

# Networking
variable "ip_range" {
  type        = string
  description = "IP range for VPC"
}

variable "subnets" {
  type = map(object({
    subnet_range      = string
    availability_zone = string
  }))
}

# EC2
variable "ec2_instance_type" {
  type        = string
  description = "Specific EC2 instance type, e.g., T3, T2, Mac, etc."
  default     = "t3.micro"
}
