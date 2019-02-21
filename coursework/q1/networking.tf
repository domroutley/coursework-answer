# Declaring network items
resource "openstack_networking_router_v2" "router_1" {
  name                = "Router 1"
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
  dns_nameservers     = ["10.239.40.2", "10.239.40.130"]
}

resource "openstack_networking_router_interface_v2" "router_1_internal_interface" { # Connect the router to the subnet
  router_id           = "${openstack_networking_router_v2.router_1.id}"
  subnet_id           = "${openstack_networking_subnet_v2.subnet_1.id}"
}

resource "openstack_networking_floatingip_v2" "drone_floating_ip" {
  description = "Drone server IP"
  pool        = "cscloud_private_floating"
}
