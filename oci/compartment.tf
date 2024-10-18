# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: compartment.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.18
# Revision...: 1.0.0
# Purpose....: Create and configure lab compartments for the LAB environment.
#              This file also gathers existing resource information for use in
#              the environment setup, such as compartment OCIDs.
# Notes......: Resources like compute instances, databases, etc., will be placed 
#              in these compartments based on the number of labs.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# Create lab compartments in the home region. The number of compartments is based
# on the number of labs defined in the variable 'numberOf_labs'. Each compartment
# is uniquely named and tagged according to the lab environment settings.
resource "oci_identity_compartment" "lab-compartment" {
  provider = oci.home # Specifies the OCI provider in the home region.

  # The 'count' is set by the number of labs, creating a compartment for each lab.
  count = var.numberOf_labs

  # The parent compartment ID where lab compartments will be created.
  compartment_id = var.compartment_ocid

  # A description of each compartment, including environment code and lab index.
  description = format("%s Compartment for %s environment %02d (%d/%d)", upper(var.environment_code), upper(local.resource_name), count.index, count.index + 1, var.numberOf_labs)

  # The name of each compartment, which is a combination of the resource name,
  # environment code, and lab index.
  name = format("%s-%s-%02d", upper(local.resource_name), upper(var.environment_code), count.index)

  # Freeform tags for tagging resources with additional metadata.
  freeform_tags = var.tags
}

# --- EOF ----------------------------------------------------------------------