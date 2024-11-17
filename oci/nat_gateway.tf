# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: nat_gateway.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.17
# Revision...: 0.10.3
# Purpose....: Define NAT Gateway resources for the Virtual Cloud Network (VCN) 
#              in the LAB environment. NAT Gateway allows instances in the private 
#              subnet to access the internet without exposing them to inbound traffic.
# Notes......: The NAT Gateway is conditionally created based on the value of 
#              var.nat_gateway_enabled.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# NAT Gateway Resource Configuration
# ------------------------------------------------------------------------------
# This resource creates a NAT Gateway for each lab environment. The NAT Gateway 
# allows instances in private subnets to access the internet for outbound traffic 
# without exposing them to inbound traffic. The NAT Gateway is created only if 
# var.nat_gateway_enabled is set to true.
resource "oci_core_nat_gateway" "natgw" {
  count = var.nat_gateway_enabled == true ? var.numberOf_labs : 0 # Create NAT Gateway only if enabled

  # The compartment where the NAT Gateway will be created.
  compartment_id = oci_identity_compartment.lab-compartment[count.index].id

  # The VCN (Virtual Cloud Network) to which this NAT Gateway belongs.
  vcn_id = oci_core_vcn.vcn[count.index].id

  # Define display name using lab-specific variables such as region, environment, and resource prefix.
  display_name = format("nat-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # Enable traffic through the NAT Gateway
  block_traffic = false # Traffic is not blocked, enabling outbound internet access

  freeform_tags = var.tags # Apply tags to the NAT Gateway for resource categorization
}

# --- EOF ----------------------------------------------------------------------
