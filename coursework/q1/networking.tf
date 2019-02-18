# Declaring network items
resource "openstack_networking_router_v2" "webservers_router" {
  name                = "Webservers router"
  admin_state_up      = "true"
  external_network_id = "79174dc9-35a3-455f-a4ea-008b56be7797"
}

resource "openstack_networking_network_v2" "webservers_network" {
  name                = "Webservers network"
  admin_state_up      = "true"
}

resource "openstack_networking_subnet_v2" "webservers_subnet" {
  name                = "Webservers subnet"
  network_id          = "${openstack_networking_network_v2.webservers_network.id}"
  cidr                = "192.168.0.0/24"
  ip_version          = "4"
}

resource "openstack_networking_router_interface_v2" "webservers_router_internal_interface" { # Connect the router to the subnet
  router_id           = "${openstack_networking_router_v2.webservers_router.id}"
  subnet_id           = "${openstack_networking_subnet_v2.webservers_subnet.id}"
}

# resource "openstack_compute_interface_attach_v2" "prod_instance_interfaces" { # Attach prod webserver to the network
#   instance_id         = "${openstack_compute_instance_v2.prod.id}"
#   network_id          = "${openstack_networking_network_v2.webservers_network.id}"
# }
#
# resource "openstack_compute_interface_attach_v2" "dev_instance_interfaces" { # Attach dev webserver to the network
#   instance_id         = "${openstack_compute_instance_v2.dev.id}"
#   network_id          = "${openstack_networking_network_v2.webservers_network.id}"
# }


# Get the floating IPs
data "openstack_networking_floatingip_v2" "prod_webserver_ip" {
  address = "10.72.96.170"
}

data "openstack_networking_floatingip_v2" "dev_webserver_ip" {
  address = "10.72.96.124"
}
