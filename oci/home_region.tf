# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: home_region.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.16
# Revision...: 0.7.0
# Purpose....: Retrieve the home region details from the tenancy in Oracle Cloud 
#              Infrastructure (OCI). This includes the home region name and key 
#              as well as the current region's name and key based on the provided 
#              region.
# Notes......: This script ensures that the correct home region is used for IAM 
#              resources, which must be provisioned in the home region, while 
#              other resources can be deployed in the current region.
# Reference..: https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_regions
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Get Tenancy Details
# ------------------------------------------------------------------------------
# This data source fetches details about the specified tenancy, including its 
# home region key, which is critical for provisioning IAM resources in the home 
# region.
data "oci_identity_tenancy" "tenancy" {
  tenancy_id = var.tenancy_ocid # The OCID of the tenancy to query
}

# ------------------------------------------------------------------------------
# Get List of Subscribed Regions
# ------------------------------------------------------------------------------
# This data source provides the list of regions to which the tenancy is subscribed.
# The list includes both the home region and any additional regions where resources 
# can be provisioned.
data "oci_identity_region_subscriptions" "subscribed_regions" {
  tenancy_id = var.tenancy_ocid # The OCID of the tenancy to query
}

# ------------------------------------------------------------------------------
# Local Variables - Home and Current Region
# ------------------------------------------------------------------------------
locals {
  # Find the home region name by matching the home region key from the tenancy 
  # with the list of subscribed regions.
  home_region_name = tolist([for region in data.oci_identity_region_subscriptions.subscribed_regions.region_subscriptions :
  region.region_name if region.region_key == data.oci_identity_tenancy.tenancy.home_region_key])[0]

  # Extract the home region key directly from the tenancy object
  home_region_key = data.oci_identity_tenancy.tenancy.home_region_key

  # Find the current region key by matching the region name (var.region) 
  # with the region_name in the subscribed regions list.
  current_region_key = tolist([for region in data.oci_identity_region_subscriptions.subscribed_regions.region_subscriptions :
  region.region_key if region.region_name == var.region])[0]

  # The current region name is directly from the provided region variable (var.region)
  current_region_name = var.region
}

# ------------------------------------------------------------------------------
# Output Values
# ------------------------------------------------------------------------------
# Output the home region name. This is typically used for provisioning IAM 
# resources that must be in the home region.
output "home_region" {
  value = local.home_region_name
}

# Output the current region name, typically the region where other resources 
# are being deployed.
output "region" {
  value = local.current_region_name
}

# Output the home region key, which identifies the home region uniquely.
output "home_region_key" {
  value = local.home_region_key
}

# Output the current region key, which identifies the current region uniquely.
output "current_region_key" {
  value = local.current_region_key
}

# --- EOF ----------------------------------------------------------------------
