# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: route.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.17
# Revision...: 1.0.0
# Purpose....: Define subnets and associated routing for Virtual Cloud Networks 
#              (VCN) in the LAB environment. This includes public and private 
#              subnets for compute and database resources, as well as routing 
#              table assignments.
# Notes......: Each lab environment gets its own VCN with public and private 
#              subnets, customized with DNS labels, security lists, and routing.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Public Subnet Configuration
# ------------------------------------------------------------------------------
# This resource defines the public subnet for each lab environment's VCN. 
# The subnet is created using a portion of the VCN's CIDR block, and is linked 
# to a public route table, allowing instances within this subnet to communicate 
# externally if needed.
resource "oci_core_subnet" "public_subnet" {
  count          = var.numberOf_labs
  compartment_id = oci_identity_compartment.lab-compartment[count.index].id
  cidr_block     = cidrsubnet(var.vcn_cidr_block, var.private_newbits, var.public_netnum) # Allocate CIDR for public subnet
  display_name   = format("sn-pub-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)
  dns_label      = local.public_dns_label
  vcn_id         = oci_core_vcn.vcn[count.index].id
  route_table_id = oci_core_route_table.public_route_table[count.index].id # Assign public route table
  # Optional: Security lists and DHCP options can be customized per requirements.
  # security_list_ids = [oci_core_vcn.vcn[count.index].default_security_list_id]
  # dhcp_options_id   = oci_core_vcn.vcn[count.index].default_dhcp_options_id
}

# ------------------------------------------------------------------------------
# Private Compute Subnet Configuration
# ------------------------------------------------------------------------------
# This resource defines the private subnet for compute resources within the VCN 
# in each lab. Instances in this subnet will not be assigned public IPs, ensuring 
# they remain isolated from the public internet. The subnet is linked to a private 
# route table and security configurations.
resource "oci_core_subnet" "private_compute_subnet" {
  count                      = var.numberOf_labs
  compartment_id             = oci_identity_compartment.lab-compartment[count.index].id
  cidr_block                 = cidrsubnet(var.vcn_cidr_block, var.private_newbits, var.private_compute_netnum) # CIDR for private compute subnet
  display_name               = format("sn-prv-comp-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)
  dns_label                  = local.private_compute_dns_label
  prohibit_public_ip_on_vnic = true # Disallow public IPs on instances in this subnet
  vcn_id                     = oci_core_vcn.vcn[count.index].id
  route_table_id             = oci_core_route_table.private_route_table[count.index].id # Assign private route table
  # Optional: Additional security lists or DHCP options can be configured as needed.
  # security_list_ids = [oci_core_vcn.vcn[count.index].default_security_list_id]
  # dhcp_options_id   = oci_core_dhcp_options.private_dhcp_option[count.index].id
}

# ------------------------------------------------------------------------------
# Private Database Subnet Configuration
# ------------------------------------------------------------------------------
# This resource defines the private subnet for database resources within the VCN 
# in each lab. Similar to the compute subnet, the database subnet does not allow 
# public IPs, ensuring databases remain secure. It is linked to a private route 
# table and security configurations.
resource "oci_core_subnet" "private_database_subnet" {
  count                      = var.numberOf_labs
  compartment_id             = oci_identity_compartment.lab-compartment[count.index].id
  cidr_block                 = cidrsubnet(var.vcn_cidr_block, var.private_newbits, var.private_db_netnum) # CIDR for private database subnet
  display_name               = format("sn-prv-db-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)
  dns_label                  = local.private_database_dns_label
  prohibit_public_ip_on_vnic = true # Disallow public IPs on instances in this subnet
  vcn_id                     = oci_core_vcn.vcn[count.index].id
  route_table_id             = oci_core_route_table.private_route_table[count.index].id # Assign private route table
  # Optional: Additional security lists or DHCP options can be configured as needed.
  # security_list_ids = [oci_core_vcn.vcn[count.index].default_security_list_id]
  # dhcp_options_id   = oci_core_dhcp_options.private_dhcp_option[count.index].id
}

# --- EOF ----------------------------------------------------------------------
