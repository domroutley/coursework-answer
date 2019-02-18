provider "openstack" {

  tenant_id     = "${var.tenant_id}"
  auth_url      = "${var.auth_url}"
  token         = "${var.token}"
}
