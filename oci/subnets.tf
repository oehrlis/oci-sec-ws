# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: subnets.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.23
# Revision...: 0.9.0
# Purpose....: Define public and private subnets for Virtual Cloud Network (VCN) 
#              resources in the LAB environment. Includes subnets for public 
#              access, private compute resources, and private databases.
# Notes......: This configuration ensures that each subnet is assigned to its 
#              corresponding route table, with the necessary DNS and security 
#              configurations. Public subnets enable external access, while 
#              private subnets ensure internal communication for compute and database.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Public Subnet Configuration
# ------------------------------------------------------------------------------
# Defines the public subnet for each lab's VCN, allowing external connectivity 
# through assigned route tables. These subnets use a portion of the VCN's CIDR 
# block and are linked to public route tables.
resource "oci_core_subnet" "public_subnet" {
  count             = var.numberOf_labs # Create one public subnet for each lab
  compartment_id    = oci_identity_compartment.lab-compartment[count.index].id
  cidr_block        = cidrsubnet(var.vcn_cidr_block, var.private_newbits, var.public_netnum)                                                                            # CIDR block for public subnet
  display_name      = format("sn-pub-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index) # Subnet name format
  dns_label         = local.public_dns_label                                                                                                                            # Assign DNS label
  vcn_id            = oci_core_vcn.vcn[count.index].id
  route_table_id    = oci_core_default_route_table.public_route_table[count.index].id # Associate with the public route table
  security_list_ids = [oci_core_default_security_list.public_security_list[count.index].id]
  dhcp_options_id   = oci_core_default_dhcp_options.public_dhcp_option[count.index].id
}

# ------------------------------------------------------------------------------
# Private Compute Subnet Configuration
# ------------------------------------------------------------------------------
# Defines the private subnet for compute instances. Instances in this subnet do 
# not have public IP addresses, ensuring internal-only communication. Each subnet 
# is assigned to a private route table for internal networking.
resource "oci_core_subnet" "private_compute_subnet" {
  count                      = var.numberOf_labs # Create one private compute subnet for each lab
  compartment_id             = oci_identity_compartment.lab-compartment[count.index].id
  cidr_block                 = cidrsubnet(var.vcn_cidr_block, var.private_newbits, var.private_compute_netnum)                                                                        # CIDR block for private compute subnet
  display_name               = format("sn-prv-comp-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index) # Subnet name format
  dns_label                  = local.private_compute_dns_label                                                                                                                        # Assign DNS label
  prohibit_public_ip_on_vnic = true                                                                                                                                                   # Disallow public IPs for security
  vcn_id                     = oci_core_vcn.vcn[count.index].id
  route_table_id             = oci_core_route_table.private_route_table[count.index].id # Associate with private route table
  security_list_ids          = [oci_core_security_list.private_security_list[count.index].id]
  dhcp_options_id            = oci_core_dhcp_options.private_dhcp_option[count.index].id
}

# ------------------------------------------------------------------------------
# Private Database Subnet Configuration
# ------------------------------------------------------------------------------
# Defines the private subnet for database instances. This subnet ensures that 
# database instances are isolated from the public internet, with internal routing 
# and no public IPs assigned.
resource "oci_core_subnet" "private_database_subnet" {
  count                      = var.numberOf_labs # Create one private database subnet for each lab
  compartment_id             = oci_identity_compartment.lab-compartment[count.index].id
  cidr_block                 = cidrsubnet(var.vcn_cidr_block, var.private_newbits, var.private_db_netnum)                                                                           # CIDR block for private database subnet
  display_name               = format("sn-prv-db-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index) # Subnet name format
  dns_label                  = local.private_database_dns_label                                                                                                                     # Assign DNS label
  prohibit_public_ip_on_vnic = true                                                                                                                                                 # Disallow public IPs for security
  vcn_id                     = oci_core_vcn.vcn[count.index].id
  route_table_id             = oci_core_route_table.private_route_table[count.index].id # Associate with private route table
  security_list_ids          = [oci_core_security_list.private_security_list[count.index].id]
  dhcp_options_id            = oci_core_dhcp_options.private_dhcp_option[count.index].id
}

# --- EOF ----------------------------------------------------------------------
