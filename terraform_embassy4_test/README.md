# Terraform authentication tests

This is a sort of hello world to check the Terraform compatibility with
Openstack environments.

## Requirements

Download a Terraform version to test from:
https://releases.hashicorp.com/terraform/

ES:

```
wget https://releases.hashicorp.com/terraform/0.14.0/terraform_0.14.0_linux_amd64.zip
unzip terraform_0.14.0_linux_amd64.zip

./terraform version
```

## Configuration

Fill the main.tf file with this information:

* application_credential_id = "1521e176a6874bd6a71f407291d7be08"
* application_credential_secret = "my-super-long-app-secret"

## Run

Check the setup and install openstack provider:
```
terraform init
```

Check the infrastructure:
```
terraform plan
```

Connect and apply:
```
terraform apply
```

## Documentation

* [Embassy userguide - Terraform](https://docs.embassy.ebi.ac.uk/userguide/Embassyv4_UserGuide.html#terraform)
