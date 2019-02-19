# Declaring network items
resource "openstack_networking_router_v2" "webservers_router" {
  name                = "Webservers router"
  admin_state_up      = "true"
  external_network_id = "79174dc9-35a3-455f-a4ea-008b56be7797"
}

resource "openstack_networking_network_v2" "network_1" {
  name                = "Network 1"
  admin_state_up      = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name                = "Subnet 1"
  network_id          = "${openstack_networking_network_v2.network_1.id}"
  cidr                = "${var.subnet_1_CIDR}"
  ip_version          = "4"
}

resource "openstack_networking_router_interface_v2" "webservers_router_internal_interface" { # Connect the router to the subnet
  router_id           = "${openstack_networking_router_v2.webservers_router.id}"
  subnet_id           = "${openstack_networking_subnet_v2.subnet_1.id}"
}
