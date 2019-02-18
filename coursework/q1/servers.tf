resource "openstack_compute_instance_v2" "webservers" {
  image_name   = "Ubuntu Server 18.04.1"                                  # The name of the image that is to be used
  flavor_name  = "m1.micro"                                               # The flavor of server to use
  count        = "${var.number_of_webservers}"                            # How many of this resource to make
  name         = "${lookup(var.instance_names, count.index)}_webserver"   # The unique name for this instance
  key_pair     = "pheonix"                                                # What ssh key pair to use
}
