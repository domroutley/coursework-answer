resource "openstack_compute_instance_v2" "prod" {
  image_name      = "${var.image}"                                              # The name of the image that is to be used
  flavor_name     = "${var.flavour}"                                            # The flavor of server to use
  name            = "Production"                                                # The unique name for this instance
  key_pair        = "${openstack_compute_keypair_v2.prod.name}"                 # What ssh key pair to use
  security_groups =                                                             # What security group/s are associated with instance
    ["${openstack_networking_secgroup_v2.web_sec_group.name}"
  ]
  network {                                                                     # Select what network/s to assign instance to
    name = "${openstack_networking_network_v2.network_1.name}"
  }
}

resource "openstack_compute_floatingip_associate_v2" "prod_ip_assoc" {
  floating_ip = "${var.prod_ip}"
  instance_id = "${openstack_compute_instance_v2.prod.id}"
}

resource "openstack_compute_keypair_v2" "prod" {
  name       = "${var.prod_access_key_name}"
  public_key = "${var.prod_access_key}"
}

resource "openstack_compute_instance_v2" "dev" {
  image_name      = "${var.image}"
  flavor_name     = "${var.flavour}"
  name            = "Development"
  key_pair        = "${openstack_compute_keypair_v2.dev.name}"
  security_groups = [
    "${openstack_networking_secgroup_v2.web_sec_group.name}"
  ]
  network {
    name = "${openstack_networking_network_v2.network_1.name}"
  }
}

resource "openstack_compute_floatingip_associate_v2" "dev_ip_assoc" {
  floating_ip = "${openstack_networking_floatingip_v2.dev_floating_ip.address}"
  instance_id = "${openstack_compute_instance_v2.dev.id}"
}

resource "openstack_compute_keypair_v2" "dev" {
  name       = "${var.dev_access_key_name}"
  public_key = "${var.dev_access_key}"
}
