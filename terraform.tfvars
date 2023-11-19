# Common
region = "us-east-1"
short_region = "useast1"

# Networking
ip_range = "10.0.0.0/25"

subnets = {
    public = {
        subnet_range = "10.0.0.0/26",
        availability_zone = data.aws_region.current
    }
    public_alt = {
        subnet_range = "10.0.0.64/26",
        availability_zone = "us-east-2"
    }
}