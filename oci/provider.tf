# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: provider.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.16
# Revision...: 0.12.2
# Purpose....: Define provider configurations for the Terraform environment. 
#              This includes the OCI provider for Oracle Cloud Infrastructure 
#              resources, as well as other necessary providers (TLS, random) 
#              for resource provisioning and configuration.
# Notes......: Configures OCI for multiple regions using an alias for the home 
#              region and a primary region for resource provisioning.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Terraform Block - Define Providers and Versions
# ------------------------------------------------------------------------------
# This block defines the required version of Terraform and the required providers 
# for this configuration, including the OCI provider, TLS provider, and Random 
# provider. Each provider has a specified version to ensure compatibility.
terraform {
  required_version = ">= 1.0.0" # Ensures that Terraform version 1.0.0 or higher is used

  required_providers {
    oci = { # OCI provider to manage Oracle Cloud Infrastructure resources
      source  = "oracle/oci"
      version = ">= 4.0.0"
    }
    tls = { # TLS provider to manage TLS keys and certificates
      source  = "hashicorp/tls"
      version = ">= 4.0.0"
    }
    random = { # Random provider to generate random values for resources (e.g., passwords)
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
    local = { # Local provider to manage local files and directories
      source  = "hashicorp/local"
      version = ">= 2.0.0" # Specify the version according to your requirements
    }
  }

  # Optionally configure a remote backend for storing Terraform state files
  # Uncomment and modify the backend configuration as necessary
  # backend "http" {
  #   update_method = "PUT"
  #   address       = ""  # Specify the backend address
  # }
}


# ------------------------------------------------------------------------------
# Primary OCI Provider Configuration
# ------------------------------------------------------------------------------
# This block configures the primary OCI provider for Oracle Cloud Infrastructure.
# It requires the user's OCI credentials, such as tenancy OCID, user OCID, API 
# fingerprint, private key, and the region where the resources will be provisioned.
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid     # The OCID of the tenancy where resources will be provisioned
  user_ocid        = var.user_ocid        # The OCID of the user performing the actions
  fingerprint      = var.fingerprint      # The fingerprint for the user's API key
  private_key_path = var.private_key_path # Path to the private key file for signing API requests
  region           = var.region           # The region where resources are created
}

# ------------------------------------------------------------------------------
# Home Region OCI Provider Configuration (for IAM Resources)
# ------------------------------------------------------------------------------
# This block configures the OCI provider for the home region using an alias. 
# It is used specifically for provisioning IAM (Identity and Access Management) 
# resources that must be created in the home region of the tenancy.
# Reference: https://medium.com/oracledevs/provision-oracle-cloud-infrastructure-home-region-iam-resources-in-a-multi-region-terraform-f997a00ae7ed
provider "oci" {
  alias            = "home"                 # Alias for the provider in the home region
  tenancy_ocid     = var.tenancy_ocid       # The OCID of the tenancy
  user_ocid        = var.user_ocid          # The OCID of the user
  fingerprint      = var.fingerprint        # The fingerprint for the user's API key
  private_key_path = var.private_key_path   # Path to the private key file
  region           = local.home_region_name # Home region, determined dynamically
}

# --- EOF ----------------------------------------------------------------------
