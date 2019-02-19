resource "openstack_compute_instance_v2" "prod" {
  image_name      = "Ubuntu Server 18.04.1"                                     # The name of the image that is to be used
  flavor_name     = "m1.micro"                                                  # The flavor of server to use
  name            = "Production Webserver"                                      # The unique name for this instance
  key_pair        = "${var.internal_access_key_name}"                           # What ssh key pair to use
  security_groups =                                                             # What security group/s are associated with instance
    ["${openstack_networking_secgroup_v2.web_sec_group.name}",
    "${openstack_networking_secgroup_v2.internal_access_sec_group.name}"
  ]
  network {                                                                     # Select what network/s to assign instance to
    name = "${openstack_networking_network_v2.network_1.name}"
  }
}

resource "openstack_compute_floatingip_associate_v2" "prod_ip_assoc" {
  floating_ip = "10.72.96.170"
  instance_id = "${openstack_compute_instance_v2.prod.id}"
}

resource "openstack_compute_instance_v2" "dev" {
  image_name      = "Ubuntu Server 18.04.1"
  flavor_name     = "m1.micro"
  name            = "Development Webserver"
  key_pair        = "${var.internal_access_key_name}"
  security_groups = [
    "${openstack_networking_secgroup_v2.web_sec_group.name}",
    "${openstack_networking_secgroup_v2.internal_access_sec_group.name}"
  ]
  network {
    name = "${openstack_networking_network_v2.network_1.name}"
  }
}

resource "openstack_compute_floatingip_associate_v2" "dev_ip_assoc" {
  floating_ip = "10.72.96.124"
  instance_id = "${openstack_compute_instance_v2.dev.id}"
}

resource "openstack_compute_instance_v2" "drone_and_management" {
  image_name      = "Ubuntu Server 18.04.1"
  flavor_name     = "m1.tiny"
  name            = "Drone and Management server"
  key_pair        = "${var.external_access_key_name}"
  security_groups = [
    "${openstack_networking_secgroup_v2.external_access_sec_group.name}"
  ]
  network {
    name = "${openstack_networking_network_v2.network_1.name}"
  }
}

resource "openstack_compute_floatingip_associate_v2" "manage_ip_assoc" {
  floating_ip = "${openstack_networking_floatingip_v2.management_floating_ip.address}"
  instance_id = "${openstack_compute_instance_v2.drone_and_management.id}"
}
