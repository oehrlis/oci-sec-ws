# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: route.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.23
# Revision...: 0.14.0
# Purpose....: Define routing tables for VCN resources in the LAB environment.
# Notes......: This file defines routing tables for public and private subnets
#              in each LAB environment based on the number of labs. It also 
#              includes conditional route rules for internet, NAT, and service 
#              gateways.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Create a public route table for routing in the public network.
# This route table will be created for each lab environment if 
# var.numberOf_labs is greater than 0. The route table is associated
# with the VCN and provides routing rules for internet access via the Internet Gateway.
# ------------------------------------------------------------------------------
resource "oci_core_default_route_table" "public_route_table" {
  # The count determines how many route tables to create, one for each lab.
  count                      = var.numberOf_labs
  manage_default_resource_id = oci_core_vcn.vcn[count.index].default_route_table_id
  # The compartment where the route table will be created.
  compartment_id = oci_identity_compartment.lab-compartment[count.index].id

  # The display name for the route table, dynamically constructed based on the
  # current region, environment code, and resource prefix, and the index of the lab.
  display_name = format("rt-pub-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # Freeform tags applied to the route table.
  freeform_tags = var.tags

  # ----------------------------------------------------------------------------
  # Conditional Route Rule for Internet Gateway
  # If Internet Gateway is enabled (var.internet_gateway_enabled == true), add a route
  # rule to route all traffic (0.0.0.0/0) through the Internet Gateway. This is typically
  # used to provide internet access for public subnets.
  # ----------------------------------------------------------------------------
  dynamic "route_rules" {
    # The route rule is added only if Internet Gateway is enabled.
    for_each = var.internet_gateway_enabled == true ? [1] : []

    # The content block defines the Internet Gateway route rule.
    content {
      # Destination for the route rule: 0.0.0.0/0 represents all traffic.
      destination = local.anywhere

      # Network entity ID is the Internet Gateway ID to which the traffic will be routed.
      network_entity_id = oci_core_internet_gateway.igw[count.index].id
    }
  }
}

# ---------------------------------------------------------------------
# Create a private route table for routing in the private network.
# This route table will be created for each lab environment if 
# var.numberOf_labs is greater than 0.
# ---------------------------------------------------------------------
resource "oci_core_route_table" "private_route_table" {
  # The count determines how many route tables to create, one for each lab.
  count = var.numberOf_labs

  # The compartment where the route table will be created.
  compartment_id = oci_identity_compartment.lab-compartment[count.index].id

  # The display name for the route table, dynamically constructed based on the
  # current region, environment code, and resource prefix, and the index of the lab.
  display_name = format("rt-prv-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # The VCN (Virtual Cloud Network) to which this route table belongs.
  vcn_id = oci_core_vcn.vcn[count.index].id

  # Freeform tags applied to the route table.
  freeform_tags = var.tags

  # ----------------------------------------------------------------------------
  # Conditional Route Rule for NAT Gateway
  # If NAT Gateway is enabled (var.nat_gateway_enabled == true), add a route
  # rule to route all traffic (0.0.0.0/0) through the NAT Gateway.
  # ----------------------------------------------------------------------------
  dynamic "route_rules" {
    # The route rule is added only if NAT Gateway is enabled.
    for_each = var.nat_gateway_enabled == true ? [1] : []

    # The content block defines the NAT Gateway route rule.
    content {
      # Destination for the route rule: 0.0.0.0/0 represents all traffic.
      destination = local.anywhere

      # Destination type is CIDR block, meaning the destination is a range of IP addresses.
      destination_type = "CIDR_BLOCK"

      # Network entity ID is the NAT Gateway ID to which the traffic will be routed.
      network_entity_id = oci_core_nat_gateway.natgw[count.index].id
    }
  }

  # ----------------------------------------------------------------------------
  # Conditional Route Rule for Service Gateway
  # If Service Gateway is enabled (var.service_gateway_enabled == true), add a route
  # rule to allow traffic to Oracle services through the Service Gateway.
  # ----------------------------------------------------------------------------
  dynamic "route_rules" {
    # The route rule is added only if Service Gateway is enabled.
    for_each = var.service_gateway_enabled == true ? list(1) : []

    # The content block defines the Service Gateway route rule.
    content {
      # Destination for the route rule: the CIDR block for Oracle Services.
      destination = data.oci_core_services.all_oci_services[0].services[0].cidr_block

      # Destination type is SERVICE_CIDR_BLOCK, meaning this rule applies to OCI services.
      destination_type = "SERVICE_CIDR_BLOCK"

      # Network entity ID is the Service Gateway ID to which the traffic will be routed.
      network_entity_id = oci_core_service_gateway.service_gateway[0].id
    }
  }
}

# --- EOF ----------------------------------------------------------------------
