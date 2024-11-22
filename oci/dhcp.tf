# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: dhcp.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.23
# Revision...: 0.14.0
# Purpose....: Define DHCP options for Virtual Cloud Network (VCN) resources in 
#              the LAB environment. This includes options for both public and 
#              private subnets, ensuring proper DNS resolution and search domain 
#              configurations within the VCN.
# Notes......: Public DHCP options are set to resolve both internal and external 
#              DNS, while private DHCP options rely on custom DNS servers.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Public DHCP Option Configuration
# ------------------------------------------------------------------------------
# This resource defines the DHCP options for public subnets in each lab environment.
# The DHCP options specify the DNS server to be used (VCN Local Plus Internet) 
# and the search domain for instances in public subnets.
resource "oci_core_default_dhcp_options" "public_dhcp_option" {
  count                      = var.numberOf_labs # Create one DHCP option for each lab environment
  manage_default_resource_id = oci_core_vcn.vcn[count.index].default_dhcp_options_id
  compartment_id             = oci_identity_compartment.lab-compartment[count.index].id # Compartment for the DHCP option

  # Define display name using lab-specific variables such as region, environment, and resource prefix
  display_name = format("dhcp-pub-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # ------------------------------------------------------------------------------
  # Domain Name Server Option
  # ------------------------------------------------------------------------------
  # Define DNS server as VCN Local Plus Internet, allowing both internal and external resolution
  options {
    server_type        = "VcnLocalPlusInternet" # Use both internal VCN DNS and external Internet DNS
    type               = "DomainNameServer"
    custom_dns_servers = [] # No custom DNS servers for public subnets
  }

  # ------------------------------------------------------------------------------
  # Search Domain Option
  # ------------------------------------------------------------------------------
  # Set search domain for instances in public subnets
  options {
    search_domain_names = [
      format("${local.resource_shortname}%02d.oraclevcn.com", count.index), # Dynamically set based on VCN
    ]
    type = "SearchDomain"
  }
}

# ------------------------------------------------------------------------------
# Private DHCP Option Configuration
# ------------------------------------------------------------------------------
# This resource defines the DHCP options for private subnets in each lab environment.
# The DHCP options specify custom DNS servers and a search domain for instances 
# in private subnets to ensure secure internal communication within the VCN.
resource "oci_core_dhcp_options" "private_dhcp_option" {
  count          = var.numberOf_labs                                        # Create one DHCP option for each lab environment
  compartment_id = oci_identity_compartment.lab-compartment[count.index].id # Compartment for the DHCP option
  vcn_id         = oci_core_vcn.vcn[count.index].id                         # Associate DHCP option with the VCN

  # Define display name using lab-specific variables such as region, environment, and resource prefix
  display_name = format("dhcp-prv-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # ------------------------------------------------------------------------------
  # Domain Name Server Option
  # ------------------------------------------------------------------------------
  # Use custom DNS servers for instances in private subnets to ensure internal communication
  options {
    type               = "DomainNameServer"
    server_type        = "CustomDnsServer"        # Specify custom DNS servers
    custom_dns_servers = local.custom_dns_servers # Custom DNS servers defined in local variables
  }

  # ------------------------------------------------------------------------------
  # Search Domain Option
  # ------------------------------------------------------------------------------
  # Set search domain for instances in private subnets
  options {
    type                = "SearchDomain"
    search_domain_names = [var.lab_domain] # Search domain set to lab domain
  }
}

# --- EOF ----------------------------------------------------------------------
