# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: internet_gateway.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.17
# Revision...: 0.14.0
# Purpose....: Define Internet Gateway (IGW) resources for Virtual Cloud Network 
#              (VCN) resources in the LAB environment. This allows outbound 
#              internet access for instances within the VCN.
# Notes......: The Internet Gateway is conditionally created based on whether 
#              var.internet_gateway_enabled is set to true. The gateway is attached 
#              to the VCN and allows traffic to and from the internet.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Internet Gateway Resource Configuration
# ------------------------------------------------------------------------------
# This resource defines the Internet Gateway (IGW) for each lab environment. 
# It is created only if var.internet_gateway_enabled is set to true. The IGW 
# allows outbound internet access from instances within the VCN. It is associated 
# with the VCN and enabled by default.
resource "oci_core_internet_gateway" "igw" {
  count = var.internet_gateway_enabled == true ? var.numberOf_labs : 0 # Create IGW only if enabled

  # The compartment where the internet gateway will be created.
  compartment_id = oci_identity_compartment.lab-compartment[count.index].id

  # The VCN (Virtual Cloud Network) to which this internet gateway belongs.
  vcn_id = oci_core_vcn.vcn[count.index].id

  # Define display name using lab-specific variables such as region, environment, and resource prefix
  display_name = format("igw-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # Enable the internet gateway to allow outbound traffic
  enabled = "true"

  # Assign freeform tags to the internet gateway for resource categorization
  freeform_tags = var.tags
}

# --- EOF ----------------------------------------------------------------------
