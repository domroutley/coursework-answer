resource "openstack_compute_instance_v2" "webservers" {
  name         = "webservers"
  image_name   = "Ubuntu Server 18.04.1"
  flavor_name  = "m1.micro"
}
