# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: vcn.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.18
# Revision...: 0.10.5
# Purpose....: Define Virtual Cloud Network (VCN) resources for the LAB environment.
#              This creates one VCN per lab, each with its own CIDR block, DNS label,
#              and associated tags.
# Notes......: The number of VCNs is dynamically calculated based on the number
#              of lab environments.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# Create Virtual Cloud Networks (VCNs) for each lab environment. The VCNs are
# created based on the number of labs specified in the 'numberOf_labs' variable.
resource "oci_core_vcn" "vcn" {
  count = var.numberOf_labs # Create one VCN for each lab.

  # Define the CIDR block for the VCN, which is passed via a variable.
  cidr_block = var.vcn_cidr_block

  # Each VCN is assigned to its respective lab compartment.
  compartment_id = oci_identity_compartment.lab-compartment[count.index].id

  # Set a descriptive display name for each VCN, which includes the region, environment code, 
  # resource prefix, and the lab index for easy identification.
  display_name = format("vcn-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # Define the DNS label for each VCN, using the resource short name and lab index.
  dns_label = format("%s%02d", lower(local.resource_shortname), count.index)

  # Disable IPv6 for the VCN (can be changed if required).
  is_ipv6enabled = "false"

  # Assign freeform tags to each VCN for easier identification and management.
  freeform_tags = var.tags
}

# --- EOF ----------------------------------------------------------------------
