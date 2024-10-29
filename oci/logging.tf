# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: logging.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.23
# Revision...: 0.6.3
# Purpose....: Define OCI Log Group and logs for subnets in the LAB environment.
#              This includes logs for public, private compute, and private 
#              database subnets.
# Notes......: Logs are created for each subnet to capture relevant data and 
#              activities. The log group is associated with the correct VCN 
#              subnets and compartments.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Create the Log Group for Each Lab Environment
# ------------------------------------------------------------------------------
# This resource creates a log group for each lab environment. Logs for public, 
# private compute, and private database subnets will be organized under this log group.
resource "oci_logging_log_group" "log_group" {
  count = var.numberOf_labs # Create one log group per lab environment

  # Compartment where the log group will be created.
  compartment_id = oci_identity_compartment.lab-compartment[count.index].id

  # Define display name using lab-specific variables such as region, environment, and resource prefix.
  display_name = format("lg-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  freeform_tags = var.tags # Apply tags to the log group
}

# ------------------------------------------------------------------------------
# Create Logs for Public Subnet
# ------------------------------------------------------------------------------
# This resource defines logs for the public subnet in each lab environment. 
# The log captures data and activities associated with the public subnet.
resource "oci_logging_log" "log_public_subnet" {
  count = var.numberOf_labs

  display_name = format("lg-sn-pub-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)
  log_group_id = oci_logging_log_group.log_group[count.index].id
  log_type     = var.log_type

  configuration {
    source {
      category    = var.log_configuration_source_category
      resource    = oci_core_subnet.public_subnet[count.index].id
      service     = var.log_configuration_source_service
      source_type = var.log_configuration_source_source_type
    }
    compartment_id = oci_identity_compartment.lab-compartment[count.index].id
  }

  freeform_tags      = var.tags
  is_enabled         = var.log_is_enabled
  retention_duration = var.log_retention_duration
}

# ------------------------------------------------------------------------------
# Create Logs for Private Compute Subnet
# ------------------------------------------------------------------------------
# This resource defines logs for the private compute subnet in each lab environment.
# It captures data and activities related to the private compute subnet.
resource "oci_logging_log" "log_private_compute_subnet" {
  count = var.numberOf_labs # Create one log per private compute subnet in each lab environment

  # Define display name for the log, including region, environment, and subnet.
  display_name = format("lg-sn-prv-comp-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # Associate the log with the log group
  log_group_id = oci_logging_log_group.log_group[count.index].id
  log_type     = var.log_type # Set the log type (e.g., SERVICE or CUSTOM)

  # Configuration settings for the log, including the source (private compute subnet).
  configuration {
    source {
      category    = var.log_configuration_source_category                  # Set source category
      resource    = oci_core_subnet.private_compute_subnet[count.index].id # Resource being logged (private compute subnet)
      service     = var.log_configuration_source_service                   # Service generating logs
      source_type = var.log_configuration_source_source_type               # Source type for the log
    }
    compartment_id = oci_identity_compartment.lab-compartment[count.index].id # Compartment for the log
  }

  freeform_tags      = var.tags                   # Apply tags to the log
  is_enabled         = var.log_is_enabled         # Enable or disable the log
  retention_duration = var.log_retention_duration # Set log retention duration
}

# ------------------------------------------------------------------------------
# Create Logs for Private Database Subnet
# ------------------------------------------------------------------------------
# This resource defines logs for the private database subnet in each lab environment.
# It captures data and activities related to the private database subnet.
resource "oci_logging_log" "log_private_database_subnet" {
  count = var.numberOf_labs # Create one log per private database subnet in each lab environment

  # Define display name for the log, including region, environment, and subnet.
  display_name = format("lg-sn-prv-db-%s-%s-%s-%02d", lower(local.current_region_key), lower(var.environment_code), lower(local.resource_prefix_shortname), count.index)

  # Associate the log with the log group
  log_group_id = oci_logging_log_group.log_group[count.index].id
  log_type     = var.log_type # Set the log type (e.g., SERVICE or CUSTOM)

  # Configuration settings for the log, including the source (private database subnet).
  configuration {
    source {
      category    = var.log_configuration_source_category                   # Set source category
      resource    = oci_core_subnet.private_database_subnet[count.index].id # Resource being logged (private database subnet)
      service     = var.log_configuration_source_service                    # Service generating logs
      source_type = var.log_configuration_source_source_type                # Source type for the log
    }
    compartment_id = oci_identity_compartment.lab-compartment[count.index].id # Compartment for the log
  }

  freeform_tags      = var.tags                   # Apply tags to the log
  is_enabled         = var.log_is_enabled         # Enable or disable the log
  retention_duration = var.log_retention_duration # Set log retention duration
}

# --- EOF ----------------------------------------------------------------------
