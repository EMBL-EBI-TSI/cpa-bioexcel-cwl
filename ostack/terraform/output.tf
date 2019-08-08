output "external_ip" {
  value = "${openstack_networking_floatingip_v2.floatingip.address}"
}

output "ssh_user" {
  value = "${var.ssh_user}"
}

