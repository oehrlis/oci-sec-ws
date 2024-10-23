# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: security.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.23
# Revision...: 0.3.2
# Purpose....: Define security lists for Virtual Cloud Network (VCN) resources 
#              in the LAB environment, including rules for public and private 
#              subnets to allow or restrict traffic.
# Notes......: Public security lists define rules for external communication, 
#              while private security lists ensure internal traffic within the 
#              VCN is secure. This includes rules for HTTP, HTTPS, and internal 
#              subnet traffic.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Public Security List Configuration
# ------------------------------------------------------------------------------
# This resource defines the security list for public subnets in each lab 
# environment. It allows outbound HTTP and HTTPS traffic and can be customized 
# with additional rules as needed.
resource "oci_core_default_security_list" "public_security_list" {
  count                      = var.numberOf_labs # Create one security list per lab
  manage_default_resource_id = oci_core_vcn.vcn[count.index].default_security_list_id
  compartment_id             = oci_identity_compartment.lab-compartment[count.index].id # Compartment for each lab

  # Define display name using lab-specific variables such as region, environment, and resource prefix
  display_name = format("sl-pub-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # ------------------------------------------------------------------------------
  # Egress Rules (Outbound Traffic)
  # ------------------------------------------------------------------------------
  # Egress rule for all traffic (within VCN and through NAT Gateway)
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0" # Allow all outbound traffic
    description = "Allow all outbound traffic"
  }
  egress_security_rules {
    protocol    = "6"                           # TCP protocol
    destination = "0.0.0.0/0"                   # Allow outbound traffic to all destinations
    description = "Allow outbound HTTP traffic" # Description of the rule

    # Allow outbound traffic on port 80 (HTTP)
    tcp_options {
      min = 80
      max = 80
    }
  }

  egress_security_rules {
    protocol    = "6"         # TCP protocol
    destination = "0.0.0.0/0" # Allow outbound traffic to all destinations
    description = "Allow outbound HTTPS traffic"

    # Allow outbound traffic on port 443 (HTTPS)
    tcp_options {
      min = 443
      max = 443
    }
  }

  # ------------------------------------------------------------------------------
  # Ingress Rules (Inbound Traffic) - Define as needed
  # ------------------------------------------------------------------------------
  # Add additional ingress rules if needed for public access (e.g., SSH, HTTP, etc.)
}

# ------------------------------------------------------------------------------
# Private Security List Configuration
# ------------------------------------------------------------------------------
# This resource defines the security list for private subnets in each lab 
# environment. It allows internal traffic within the VCN and restricts external 
# traffic, ensuring private subnets are secure.
resource "oci_core_security_list" "private_security_list" {
  count = var.numberOf_labs # Create one security list per lab

  compartment_id = oci_identity_compartment.lab-compartment[count.index].id # Compartment for each lab
  vcn_id         = oci_core_vcn.vcn[count.index].id                         # Associate security list with the VCN

  # Define display name using lab-specific variables such as region, environment, and resource prefix
  display_name = format("sl-prv-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # ------------------------------------------------------------------------------
  # Egress Rules (Outbound Traffic)
  # ------------------------------------------------------------------------------
  # Egress rule for all traffic (within VCN and through NAT Gateway)
  egress_security_rules {
    protocol    = "all"
    destination = local.anywhere # Allow all outbound traffic
    description = "Allow all outbound traffic"
  }

  egress_security_rules {
    protocol    = "17"           # UDP protocol
    destination = local.anywhere # Allow outbound traffic to all destinations
    description = "Allow outbound DNS traffic"

    # Allow outbound traffic on port 80 (HTTP)
    udp_options {
      min = 53
      max = 53
    }
  }
  egress_security_rules {
    protocol    = "6"            # TCP protocol
    destination = local.anywhere # Allow outbound traffic to all destinations
    description = "Allow outbound HTTP traffic"

    # Allow outbound traffic on port 80 (HTTP)
    tcp_options {
      min = 80
      max = 80
    }
  }

  egress_security_rules {
    protocol    = "6"            # TCP protocol
    destination = local.anywhere # Allow outbound traffic to all destinations
    description = "Allow outbound HTTPS traffic"

    # Allow outbound traffic on port 443 (HTTPS)
    tcp_options {
      min = 443
      max = 443
    }
  }

  # ------------------------------------------------------------------------------
  # Ingress Rules (Inbound Traffic)
  # ------------------------------------------------------------------------------
  # Ingress rule for VCN internal communication
  ingress_security_rules {
    protocol    = "all"              # Allow all protocols
    source      = var.vcn_cidr_block # Allow all inbound traffic within the VCN
    description = "Allow all inbound traffic within the VCN"
  }

}

# --- EOF ----------------------------------------------------------------------
