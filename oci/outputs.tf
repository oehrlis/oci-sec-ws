# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: outputs.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.16
# Revision...: 0.10.3
# Purpose....: Define and organize the output values for the Terraform configuration.
#              These outputs include the OCIDs for compartments, VCNs, Autonomous 
#              Databases (ADB), and webserver instances in the LAB environment.
# Notes......: Sensitive outputs such as private keys and passwords are marked as 
#              sensitive to prevent accidental exposure.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Generic Outputs
# ------------------------------------------------------------------------------
output "comments" {
  value = "Completing the resource provisioning, especially the OS configuration of the compute instances, may take some time, as this process relies on cloud-init after the stack has been deployed."
}

output "lab_url" {
  description = "Lab Workshop URL."
  value       = "http://code.oradba.ch/oci-sec-ws"
}

output "lab_source_code" {
  description = "Lab source code URL."
  value       = "https://github.com/oehrlis/oci-sec-ws"
}

output "deployed_to_region" {
  description = "The OCI region where the lab resources have beendeployed to."
  value       = var.region
}

output "created_lab_environments" {
  description = "The number of created lab environments."
  value       = var.numberOf_labs
}

# ------------------------------------------------------------------------------
# General Lab Environment Outputs
# ------------------------------------------------------------------------------
# Outputs for Lab compartments and VCNs. These provide the identifiers and 
# names for the key resources in each LAB environment.
output "lab_compartment" {
  description = "List of Lab Compartments."
  value       = [for compartment in oci_identity_compartment.lab-compartment : compartment.name]
}

output "vcn_id" {
  description = "List of IDs for created VCNs."
  value       = oci_core_vcn.vcn[*].id
}

# ------------------------------------------------------------------------------
# Security and Credential Outputs (Sensitive)
# ------------------------------------------------------------------------------
# Sensitive outputs for generated SSH keys and default passwords. These values 
# are sensitive and should be treated with care to ensure they are not exposed.
### Important Security Notice ###
# The private key generated by this resource will be stored unencrypted in your 
# Terraform state file. Use of this resource for production deployments is not 
# recommended. Instead, generate a private key file outside of Terraform and 
# distribute it securely to the system where Terraform will be run.
output "generated_private_key_pem" {
  value     = tls_private_key.lab_ssh_key.private_key_pem
  sensitive = true
}

output "generated_lab_password" {
  value     = local.lab_def_password
  sensitive = true
}

output "generated_private_key_file" {
  value = file("${path.root}/etc/id_rsa")
}

# ------------------------------------------------------------------------------
# Autonomous Database (ADB) Specific Outputs
# ------------------------------------------------------------------------------
# Outputs related to Autonomous Databases (ADB), including OCIDs, database 
# names, versions, and connection strings.
output "adb_id" {
  description = "OCID of the ADB databases."
  value       = oci_database_autonomous_database.autonomous_database[*].id
}

output "adb_db_name" {
  description = "The database name."
  value       = oci_database_autonomous_database.autonomous_database[*].db_name
}

output "adb_db_version" {
  description = "The database version."
  value       = oci_database_autonomous_database.autonomous_database[*].db_version
}

output "adb_connection_strings" {
  description = "The connection string used to connect to the Autonomous Database. The username for the Service Console is ADMIN. Use the password you entered when creating the Autonomous Database for the password value."
  value       = oci_database_autonomous_database.autonomous_database[*].connection_strings
}

# ------------------------------------------------------------------------------
# Webserver Instance Specific Outputs
# ------------------------------------------------------------------------------
# Outputs related to webserver instances, including OCIDs, instance names, 
# and private IP addresses.
output "webserver_id" {
  description = "OCID of the webserver instances."
  value       = oci_core_instance.webserver_instance[*].id
}

output "webserver_instance_name" {
  description = "The hostname for the VNIC's primary private IP of the webserver instances."
  value       = oci_core_instance.webserver_instance[*].hostname_label
}

output "webserver_instance_private_ip" {
  description = "The private IP address of the webserver instances."
  value       = oci_core_instance.webserver_instance[*].private_ip
}

# --- EOF ----------------------------------------------------------------------
