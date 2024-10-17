# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: compartment.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@accenture.com
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.16
# Revision...: 
# Purpose....: Collect information on existing ressources for this configuration.data
#              e.g. base linux OCID, compartment OCID, etc
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# create the lab compartments in home region
resource "oci_identity_compartment" "lab-compartment" {
  provider       = oci.home
  count          = var.numberOf_labs
  compartment_id = var.compartment_ocid
  description    = format("LAB Compartment for %s environment %02d (%d/%d)", upper(local.resource_name), count.index, count.index + 1, var.numberOf_labs)
  name           = var.label_prefix == "none" ? format("%s-Lab%02d", upper(local.resource_name), count.index) : format("${var.label_prefix}-%s-Lab%02d", upper(local.resource_name), count.index)
  freeform_tags  = var.tags
}

# --- EOF -------------------------------------------------------------------
