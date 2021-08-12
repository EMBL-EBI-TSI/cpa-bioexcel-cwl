terraform {
   required_version = ">= 1.0.4"
   required_providers {
     openstack = {
       source = "terraform-provider-openstack/openstack"
       version = "~> 1.35.0"
     }
   }
 }
