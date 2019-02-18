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
