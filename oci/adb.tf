# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: adb.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.23
# Revision...: 0.6.1
# Purpose....: Define Autonomous Database (ADB) resources for the LAB environment.
# Notes......: This resource creates Autonomous Databases (ADB) across multiple 
#              labs using the specified configuration, such as compute count,
#              workload type, and storage size.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

resource "oci_database_autonomous_database" "autonomous_database" {
  # Create an ADB instance for each lab. The total number of ADBs is calculated
  # by multiplying the number of labs with the number of ADB instances per lab.
  count = var.numberOf_labs * var.adb_per_lab

  # Assign each ADB to the correct lab compartment, distributed across the labs
  # Determine the lab environment for each database by using `floor(count.index / var.adb_per_lab)`.
  compartment_id = oci_identity_compartment.lab-compartment[floor(count.index / var.adb_per_lab)].id

  # Administrative password for the ADB instances
  admin_password = local.lab_def_password

  # Set the maintenance schedule type for the Autonomous Database to "REGULAR"
  autonomous_maintenance_schedule_type = "REGULAR"

  # Define the compute resources for the ADB instances
  compute_count           = var.adb_compute_count
  compute_model           = var.adb_compute_model
  data_storage_size_in_gb = var.adb_data_storage_size_in_gb

  # Generate a unique DB name using lab name, index, workload type, version, and lab index
  db_name = upper(
    replace(
      format("%s%02d%s%s%02d",
        local.resource_prefix_shortname,
        floor(count.index / var.adb_per_lab),
        local.db_workload_type,
        var.adb_version,
        count.index % var.adb_per_lab + 1
      )
      , "-", ""
    )
  )

  # Define the database version and workload type (e.g., OLTP, DW, etc.)
  db_version  = var.adb_version
  db_workload = var.adb_workload

  # Display name format for the ADB, includes region key, environment code, and lab number
  display_name = format("adb-%s-%s-%s-%02d-%s",
    lower(local.current_region_key),
    lower(var.environment_code),
    lower(local.resource_prefix_shortname),
    floor(count.index / var.adb_per_lab),
  lower(format("%s%s%02d", local.db_workload_type, var.adb_version, count.index % var.adb_per_lab + 1)))

  # Specify that the ADB is not dedicated, it's for development tier
  is_dedicated = "false"
  is_dev_tier  = var.adb_is_dev_tier

  # Define other ADB settings related to security and license model
  is_mtls_connection_required                    = "false"
  is_preview_version_with_service_terms_accepted = "false"
  license_model                                  = "LICENSE_INCLUDED"

  # Specify the IP addresses that can access the ADB instances (whitelisting)
  whitelisted_ips = [oci_core_vcn.vcn[count.index].id]
}
# --- EOF ----------------------------------------------------------------------
