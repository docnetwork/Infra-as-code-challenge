# Common
environment  = "prod"
region       = "us-west-2"
short_region = "uswest2"
app_name     = "DocNetwork"

# Networking
ip_range = "10.0.0.0/25"

subnets = {
  public = {
    subnet_range      = "10.0.0.0/26",
    availability_zone = "us-west-2a"
  }
  public_alt = {
    subnet_range      = "10.0.0.64/26",
    availability_zone = "us-west-2b"
  }
}