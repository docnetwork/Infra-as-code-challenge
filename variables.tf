variable "access_key" {
  type = string
  description = "AWS access key ID"
}

variable "secret_key" {
    type = string
    description = "AWS access key secret"
}

variable "region" {
    type = string
    description = "AWS region"
}

variable "short_region" {
    type = string
    description = "AWS region code (short)"
}

variable "ip_range" {
    type = string
    description = "IP range for VPC"
}

variable "subnets" {
    type = map(object({
    subnet_range       = string
    availability_zone  = string
  }))
