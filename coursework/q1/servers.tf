resource "openstack_compute_instance_v2" "prod" {
  image_name   = "Ubuntu Server 18.04.1"         # The name of the image that is to be used
  flavor_name  = "m1.micro"                      # The flavor of server to use
  name         = "Production Webserver"          # The unique name for this instance
  key_pair     = "pheonix"                       # What ssh key pair to use
}
resource "openstack_compute_instance_v2" "dev" {
  image_name   = "Ubuntu Server 18.04.1"
  flavor_name  = "m1.micro"
  name         = "Development Webserver"
  key_pair     = "pheonix"
}
