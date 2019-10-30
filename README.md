# Cloud Portal Application - bioexcel-cwl
Cloud Portal Bioexcel application to create VM with tools such as CWL, toil, docker and nfs client.
It uses the ubuntu 18.04 image from openstack and installs tolls cwl, toil, docker using ansible.

---

## Requirements


## Instructions

## Default values

### `Deployment parameters`

| Parameter name          | Parameter value       |
| ---                     | ---                   |
| `disk_image_name`       | `ubuntu-18.04`        |
| `remote_user`           | `ubuntu`              |
| `machine_type`          | `s1.small`            |
| `local_folder`          | `nfs-imports`         |
| `floating_ip_pool`      | `ext-net`             |
| `network_name`          | ``                    |
| `ssh_key`               | ``                    |
| `public_key_path`       | `~/.ssh/id_rsa.pub`   |
| `private_key_path`      | `~/.ssh/id_rsa`       |
| `user_private_key_path` | `~/.ssh/id_rsa`       |
| `name`                  | `CWL Instance`        |
| `nfs_install`           | `yes` or  `yes`       |
| `workflow_url`          | `https://github.com/` |

### `Inputs`

| Parameter name          | Parameter value       |
| ---                     | ---                   |
| `nfs_server_host`       | ``                    |
| `remote_folder`         | `/var/nfs`            |

### Open Ports
The virtual machine provided will have this ports open.

`ICMP`: `all`  
`TCP` : `22`

### Ansible roles
Ansible Galaxy: indigo-dc.nfs
[https://galaxy.ansible.com/indigo-dc/nfs/](https://galaxy.ansible.com/indigo-dc/nfs/)
