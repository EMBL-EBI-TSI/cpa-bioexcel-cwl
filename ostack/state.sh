#!/usr/bin/env bash
set -e
# Get the status of a virtual machine instance

# Query Terraform state file
export APP="${PORTAL_APP_REPO_FOLDER}"
export DPL="${PORTAL_DEPLOYMENTS_ROOT}/${PORTAL_DEPLOYMENT_REFERENCE}/"
terraform -chdir=${APP} show -json ${DPL}'terraform.tfstate'
