terraform {
   required_version = ">= 0.9.0"
   required_providers {
     openstack = {
       source = "terraform-provider-openstack/openstack"
       version = "~> 1.35.0"
     }
   }
}

provider "openstack" {
  user_name = "${var.user_name}"
  tenant_name = "${var.tenant_name}"
  auth_url = "${var.auth_url}"
  region = "${var.region}"
}
