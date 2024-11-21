# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: datasource.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.16
# Revision...: 0.13.1
# Purpose....: Collect information on existing resources for the LAB environment 
#              configuration, such as base Linux image OCID, compartment OCID, 
#              and availability domains.
# Notes......: These data sources gather information necessary for creating 
#              resources in the LAB environment based on pre-existing infrastructure.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# Fetch compartment details for the LAB environment using the provided OCID.
data "oci_identity_compartment" "lab_compartment" {
  id = var.compartment_ocid # The compartment OCID is passed as a variable.
}

# Retrieve a list of availability domains (ADs) for the tenancy. These ADs will
# be used to distribute resources such as compute instances across different 
# fault-tolerant zones within the tenancy.
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid # The tenancy OCID is used to fetch ADs.
}

# Retrieve the latest Oracle Linux image for the web server instances based on
# the specified operating system, version, and shape. The image list is sorted 
# by creation time to ensure that the most recent image is used.
data "oci_core_images" "oracle_images" {
  compartment_id           = var.compartment_ocid              # The compartment to query for images.
  operating_system         = var.webserver_instance_os         # OS type (e.g., Oracle Linux).
  operating_system_version = var.webserver_instance_os_version # OS version (e.g., 8).
  shape                    = var.webserver_instance_shape      # Shape for compatibility (e.g., VM.Standard2.1).
  sort_by                  = "TIMECREATED"                     # Sort the images by creation time to get the latest image.
}

# --- EOF ----------------------------------------------------------------------
