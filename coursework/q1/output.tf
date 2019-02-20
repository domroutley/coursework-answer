output "prod_ip" {
  value = "${openstack_compute_floatingip_associate_v2.prod_ip_assoc.floating_ip}"
}

output "prod_sec_groups" {
  value = "${openstack_compute_instance_v2.prod.security_groups}"
}

output "prod_key" {
  value = "${openstack_compute_instance_v2.prod.key_pair}"
}

output "dev_ip" {
  value = "${openstack_compute_floatingip_associate_v2.dev_ip_assoc.floating_ip}"
}

output "dev_sec_groups" {
  value = "${openstack_compute_instance_v2.dev.security_groups}"
}

output "dev_key" {
  value = "${openstack_compute_instance_v2.dev.key_pair}"
}

output "drone_ip" {
  value = "${openstack_networking_floatingip_v2.drone_floating_ip.address}"
}

output "drone_sec_groups" {
  value = "${openstack_compute_instance_v2.drone.security_groups}"
}

output "drone_key" {
  value = "${openstack_compute_instance_v2.drone.key_pair}"
}
