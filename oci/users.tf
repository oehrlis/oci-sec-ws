# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: users.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.16
# Revision...: 0.10.0
# Purpose....: Define IAM resources for the LAB environment.
# Notes......: 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# Create the lab user
resource "oci_identity_user" "lab_user" {
  provider = oci.home # Specifies the OCI provider in the home region.
  # The tenancy OCID to create the groups
  compartment_id = var.tenancy_ocid
  # The 'count' is set by the number of labs, creating a compartment for each lab.
  count       = var.numberOf_labs
  name        = lower(format("%s-%s%02d", upper(var.environment_code), upper(local.resource_name_prefix), count.index))
  description = format("Lab User %s-%s%02d for compartment %s, generated by Terraform", upper(var.environment_code), upper(local.resource_name_prefix), count.index, oci_identity_compartment.lab-compartment[count.index].name)
}

# Create the group 'lab_root_group'
resource "oci_identity_group" "lab_root_group" {
  provider = oci.home # Specifies the OCI provider in the home region.
  # The tenancy OCID to create the groups
  compartment_id = var.tenancy_ocid
  name           = lower(format("grp-root-%s-%s", upper(var.environment_code), upper(local.resource_name_prefix)))
  description    = "Group to manage required lab resources in tenancy, generated by Terraform"
}

# Create the group 'lab_groups'
resource "oci_identity_group" "lab_groups" {
  provider = oci.home # Specifies the OCI provider in the home region.
  # The tenancy OCID to create the groups
  compartment_id = var.tenancy_ocid
  # The 'count' is set by the number of labs, creating a compartment for each lab.
  count       = var.numberOf_labs
  name        = lower(format("grp-%s-%s%02d", upper(var.environment_code), upper(local.resource_name_prefix), count.index))
  description = format("Group to manage resources in compartment %s, generated by Terraform", oci_identity_compartment.lab-compartment[count.index].name)
}

# Add the user to the group 'lab_root_group'
resource "oci_identity_user_group_membership" "lab_root_group_membership_user" {
  provider = oci.home # Specifies the OCI provider in the home region.
  # The 'count' is set by the number of labs, creating a compartment for each lab.
  count    = var.numberOf_labs
  user_id  = oci_identity_user.lab_user[count.index].id
  group_id = oci_identity_group.lab_root_group.id
}

# Add the user to the group 'lab_group'
resource "oci_identity_user_group_membership" "lab_group_membership_user" {
  provider = oci.home # Specifies the OCI provider in the home region.
  # The 'count' is set by the number of labs, creating a compartment for each lab.
  count    = var.numberOf_labs
  user_id  = oci_identity_user.lab_user[count.index].id
  group_id = oci_identity_group.lab_groups[count.index].id
}

# Create the policy 'lab_root_policy' to allow managing all required lab resources in tenancy 
resource "oci_identity_policy" "lab_root_policy" {
  provider = oci.home # Specifies the OCI provider in the home region.
  # The tenancy OCID to create the groups
  compartment_id = var.tenancy_ocid
  name           = lower(format("pol-root-%s-%s", upper(var.environment_code), upper(local.resource_name_prefix)))
  description    = "Policy to manage lab resources in tenancy, generated by Terraform."
  # Policy statement to allow managing resources in the compartment xyz
  statements = [
    format("Allow group %s to use cloud-guard-config in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to use cloud-guard-config in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to use ons-topics in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to manage ons-subscriptions in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to manage cloudevents-rules in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to use cloud-shell in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to read app-catalog-listing in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to manage vaults in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to manage keys in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to manage secret-family in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to use key-delegate in tenancy", oci_identity_group.lab_root_group.name),

    format("Allow group %s to use floating-ips in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to use load-balancers in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to use waas-family in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to use web-app-firewall in tenancy", oci_identity_group.lab_root_group.name),
    format("Allow group %s to use waf-policy in tenancy", oci_identity_group.lab_root_group.name)
  ]
}

# Create the policy 'lab_policy' to allow managing all resources in compartment 
resource "oci_identity_policy" "lab_policy" {
  provider = oci.home # Specifies the OCI provider in the home region.
  # The 'count' is set by the number of labs, creating a compartment for each lab.
  count       = var.numberOf_labs
  name        = lower(format("pol_%s-%s%02d", upper(var.environment_code), upper(local.resource_name_prefix), count.index))
  description = format("Policy to allow managing lab resources in compartment %s, generated by Terraform.", oci_identity_compartment.lab-compartment[count.index].name)
  # The parent compartment ID where lab compartments will be created.
  compartment_id = var.compartment_ocid
  # Policy statement to allow managing resources in the compartment xyz
  statements = [
    format("Allow group %s to manage buckets in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage objects in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage cloud-guard-family in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage cloud-guard-config in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage security-zone in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage security-recipe in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage security-zone in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage security-recipe in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to use ons-topic in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage cloudevents-rules in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage vaults in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage keys in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage secret-family in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to manage instance-family in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to use volume-family in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to use virtual-network-family in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to use load-balancers in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to use security-lists in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name),
    format("Allow group %s to use vcns in compartment %s", oci_identity_group.lab_groups[count.index].name, oci_identity_compartment.lab-compartment[count.index].name)
  ]
}

# --- EOF ----------------------------------------------------------------------
