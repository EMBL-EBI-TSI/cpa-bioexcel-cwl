####################################################################################################
# These are what you'd expect to be defined in one of ECP's Profile -> Deployment Parameters       #
# settings as they're submissible on a per-project basis                                           #
####################################################################################################

variable "user_name" {
  default = "default.user_name"
  description = "Your email (although I don't think the value is used or verified at any point!)"
}
variable "tenant_name" {
  default = "default.tenant_name"
  description = "See https://uk1.embassy.ebi.ac.uk/identity/application_credentials/create/, or OpenStack CLI openstack project list"
}

####################################################################################################
# These variables you'd expect to be consistent across projects (although disk_image_name maybe    #
# less so perhaps?!)                                                                               #         
####################################################################################################

variable "auth_url" {
  default = "https://uk1.embassy.ebi.ac.uk:5000"
  description = "See https://uk1.embassy.ebi.ac.uk/project/api_access/ (Identity Service), or https://uk1.embassy.ebi.ac.uk/identity/application_credentials/create/"
}
variable "region" {
  default = "RegionOne"
  description = "See https://uk1.embassy.ebi.ac.uk/identity/application_credentials/create/ or OpenStack CLI openstack region list"
}

#### Deployment ####
variable "name" {
  default     = "cwl vm environment"
  description = "The name of the deployment"
}

variable "instances" {
  default     = 1
  description = "Number of instances to install"
}

variable "deployment_path" {
  default     = "."
  description = "Local path where to save terraform deployment output"
}

#### OpenStack ####
variable "disk_image_name" {
  default     = "ubuntu-18_04-python"
  description = "OS image name to use for installation"
}

variable "machine_type" {
  default     = "2c4m80d"
  description = "Machine type (flavor)"
}

variable "floating_ip_pool" {
  default = "public"
}

variable "network_name" {
  description = "The name of the OpenStack network where to deploy the instance"
}

#### SSH ####
variable "public_key_path" {
  description = "The path of the public SSH key to be injected in the vm"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "The path of the private SSH key to be used to connect to the the vm"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "ssh_key" {
  description = "The public SSH key to be injected in the vm"
  type        = string
}

variable "ssh_user" {
  default     = "ubuntu"
  description = "SSH user to login to VM"
  type        = string
}

variable "user_private_key_path" {
  description = "The path of the private SSH key connected to the public SSH key to be injected in the vm. This key will be not used by terraform or ansible, but the path will used only to build a personalised ssh.config file. If not set up, it will assume the key is located in ~/.ssh/id_rsa"
  type        = string
  default     = "~/.ssh/id_rsa"
}
