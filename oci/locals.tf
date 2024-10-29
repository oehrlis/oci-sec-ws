# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: locals.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.23
# Revision...: 0.6.3
# Purpose....: Define local variables for this Terraform configuration. These 
#              local variables simplify resource naming, password generation, 
#              network settings, and instance-specific configurations for the 
#              LAB environment.
# Notes......: Local variables are computed dynamically based on user input 
#              (via variables), and are used across various resources such as 
#              VCN, compute instances, and Autonomous Databases (ADB).
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

locals {
  # ----------------------------------------------------------------------------
  # General Local Variables
  # ----------------------------------------------------------------------------
  # These local variables are used for generic resource management, including 
  # availability domains, resource naming, password generation, and SSH keys.
  resource_name             = var.resource_name == "" ? data.oci_identity_compartment.lab_compartment.name : var.resource_name                       # Use compartment name if resource name is not provided
  resource_name_prefix      = var.label_prefix == "" ? local.resource_name : format("%s-%s", var.label_prefix, local.resource_name)                  # Prefix resource shortname if label prefix is set
  resource_shortname        = lower(replace(local.resource_name, "-", ""))                                                                           # Remove dashes and convert to lowercase for shortname
  resource_prefix_shortname = lower(var.label_prefix == "" ? local.resource_shortname : format("%s-%s", var.label_prefix, local.resource_shortname)) # Prefix resource shortname if label prefix is set
  lab_def_password          = var.lab_def_password == "" ? random_password.lab_password.result : var.lab_def_password                                # Use generated password if not provided
  ssh_public_key_path       = var.ssh_public_key_path == "" ? "${path.root}/etc/default_authorized_keys" : var.ssh_public_key_path                   # Default path for SSH public keys
  ssh_public_key            = var.ssh_public_key == "" ? file(local.ssh_public_key_path) : var.ssh_public_key                                        # Load SSH public key from file if not provided
  ssh_authorized_keys       = join("", [local.ssh_public_key, tls_private_key.lab_ssh_key.public_key_openssh])                                       # Combine public key with generated key

  # ----------------------------------------------------------------------------
  # VCN / Network Specific Local Variables
  # ----------------------------------------------------------------------------
  # These variables manage networking settings, including DNS labels, subnets, 
  # and custom DNS servers for the VCN and its resources.
  anywhere                   = "0.0.0.0/0"                                                                                                    # CIDR block for unrestricted access (anywhere)
  public_dns_label           = "pub"                                                                                                          # DNS label for public subnet
  private_compute_dns_label  = "prvcomp"                                                                                                      # DNS label for private compute subnet
  private_database_dns_label = "prvdb"                                                                                                        # DNS label for private database subnet
  default_private_dns        = cidrhost(cidrsubnet(var.vcn_cidr_block, var.private_newbits, var.private_compute_netnum), var.lab_dns_hostnum) # Compute default private DNS
  lab_private_dns            = var.lab_private_dns == "default" ? local.default_private_dns : var.lab_private_dns                             # Use default private DNS if not explicitly set
  custom_dns_servers         = length(var.custom_dns_servers) == 0 ? [local.lab_private_dns, var.lab_public_dns] : var.custom_dns_servers     # Set custom DNS servers if provided, otherwise use defaults

  # ----------------------------------------------------------------------------
  # Webserver Specific Local Variables
  # ----------------------------------------------------------------------------
  # These variables are specific to the webserver instances, including image ID.
  webserver_instance_image_id = var.webserver_instance_image_id == "OEL" ? data.oci_core_images.oracle_images.images[0].id : var.webserver_instance_image_id # Use OEL image if specified, otherwise custom

  # ----------------------------------------------------------------------------
  # Autonomous Database (ADB) Specific Local Variables
  # ----------------------------------------------------------------------------
  # Define the appropriate database workload type based on user input.
  db_workload_type = (
    var.adb_workload == "OLTP" ? "ATP" :
    var.adb_workload == "DW" ? "ADW" :
    var.adb_workload == "APEX" ? "APX" :
    var.adb_workload == "AJD" ? "AJD" : "ATP" # Default to ATP if no valid workload is provided
  )
}

# --- EOF ----------------------------------------------------------------------
