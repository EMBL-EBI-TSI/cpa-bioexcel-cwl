# ECP (EBI Cloud Portal) Application - bioexcel-cwl

ECP BioExcel application to create a VM with tools such as CWL, toil, docker and nfs client
installed. If deploying in OpenStack it will use a bespoke Ubuntu 18.04 image as a base OS, with
Ansible installing the CWL, toil and docker tools.

---

## Requirements

A base Ubuntu 18.04 image with some Python packages pre-installed. On the EBI's Embassy4 OpenStack
cloud the image is currently called `ubuntu-18_04-python`, although the presence of this image will
need to be verified by someone with access to Embassy4 before deploying this application.

## Instructions

To use this application in the ECP

 * Log into the ECP (https://cloud-portal.ebi.ac.uk/)
 * Define some portal "Cloud Credentials" and "Deployment Parameters" as appropriate (see below
   for examples)
 * Define a portal "Configuration" (derived from "Cloud Credentials" and "Deployment Parameters")
 * Create a new project (by using this GitHub URL)
 * Select the project and use the "Configuration"
 * Click "DEPLOY"

## Testing

### To test a **deployed** VM

These instructions assume that a `workflow_url` value of `https://github.com/douglowe/biobb_hpc_cwl_md_list`
was specified, in which case visit that GitLab repo for up-to-date information, but it works with
commit #97122f2 at least!

 * `ssh` into the VM
 * `(cwl_bioexcel) ubuntu@tsi1632989604005-1:~/cwl_bioexcel$ cd ../workflow/`
 * `(cwl_bioexcel) ubuntu@tsi1632989604005-1:~/workflow$ cwl-runner md_launch.cwl md_list_input_descriptions.yml`

That should kick off a series of workflow steps.

## Default values

### "Deployment Parameters"

The current default values can be determined from the content of [variables.tf](ostack/terraform/variables.tf) (or
in some cases the [deploy.sh](ostack/deploy.sh) script). If you want to use your own values, specify them by
matching against the parameter name in the "Deployment Parameters".

| Parameter name          | **Default** parameter value          | Overwrite <b> default? | Description                                             |
| ---                     | ---                                  | ---       | ---                                                     |
| `user_name`             | `default.user_name`                  | Optional  | Your email                                              |
| `tenent_name`           | `default.tenant_name`                | Yes       | OpenStack tenant name                                   |
| `auth_url`              | `https://uk1.embassy.ebi.ac.uk:5000` | Optional  | OpenStack API Identity Service URL                      |
| `region`                | `RegionOne`                          | TBD       | OpenStack Region                                        |
| `name`                  | `cwl vm environment`                 | TBD       | Abitrary deployment name                                |
| `instances`             | `1`                                  | TBD       | Number of instances to install                          |
| `deployment_path`       | `.`                                  | TBD       | Local path to save terraform deployment output          |
| `disk_image_name`       | `ubuntu-18_04-python`                | Optional  | OpenStack Compute Image name                            |
| `machine_type`          | `2c4m80d`                            | Optional  | OpenStack Machine type ("flavor")                       |
| `floating_ip_pool`      | `public`                             | Optional  | OpenStack Network name for Floating IPs                 |
| `network_name`          | undefined                            | Yes       | OpenStack Network name                                  |
| `remote_user`           | `ubuntu`                             | TBD       | Remove VM user                                          |
| `local_folder`          | `nfs-imports`                        | TBD       | Local folder                                            | 
| `ssh_key`               | undefined                            | TBD       | Public key to inject into the VM                        |
| `public_key_path`       | `~/.ssh/id_rsa.pub`                  | TBD       | Path of public SSH key to be injected in the VM         |
| `private_key_path`      | `~/.ssh/id_rsa`                      | TBD       | Path of private SSH key to connect to the VM            |
| `user_private_key_path` | `~/.ssh/id_rsa`                      | TBD       | (see [variables.tf](ostack/terraform/variables.tf))     |
| `nfs_install`           | `yes` or  `no`                       | TBD       |                                                         |
| `workflow_url`          | undefined                            | Optional  | e.g. https://github.com/douglowe/biobb_hpc_cwl_md_list  |

### `Inputs`

| Parameter name          | Parameter value       |
| ---                     | ---                   |
| `nfs_server_host`       | `IP`                  |
| `remote_folder`         | `/var/nfs`            |

### Open Ports

The virtual machine provided will have this ports open.

`ICMP`: `all`  
`TCP` : `22`

### Ansible roles

Ansible Galaxy: indigo-dc.nfs
[https://galaxy.ansible.com/indigo-dc/nfs/](https://galaxy.ansible.com/indigo-dc/nfs/)
