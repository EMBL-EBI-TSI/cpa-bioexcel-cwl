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
  user_name = "tsi@ebi.ac.uk"
  application_credential_id = <changeme>
  application_credential_secret = <changeme>
  tenant_name = "ebi-sdo-ecp-deployments-v4-51845837"
  auth_url = "https://uk1.embassy.ebi.ac.uk:5000"
  region = "RegionOne"
}

resource "openstack_networking_secgroup_v2" "test_terraform" {
  name        = "test_terraform"
  description = "Testing terraform connection."
}
