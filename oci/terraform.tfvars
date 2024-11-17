# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: terraform.tfvars
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.18
# Revision...: 0.10.5
# Purpose....: Define variable values for the terraform module for setting up the 
#              TVDLAB environment. The variables are organized for clarity and 
#              easier customization with inline comments for each setting.
# Notes......: Adjust the values below as necessary to fit your environment.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Generic Variables
# ------------------------------------------------------------------------------
# defined by environment variables ---------------------------------------------
# fingerprint             = ""
# private_key_path        = ""
# tenancy_ocid            = ""
# user_ocid               = ""

# provider identity parameters -------------------------------------------------
# region                  = "eu-zurich-1" # The OCI region where resources will be created
# compartment_ocid        = ""            # OCID of the compartment where to create all resources
# resource_name           = ""            # user-friendly string to name all resource. If undefined it will be derived from compartment name.
# ad_index                = 1             # Availability domain index

# - TAGs and Scheduling parameters ---------------------------------------------
# destroy_date            = "2024-12-31"  # Date to automatically destroy resources
# Define Lab schedule for:
# - weekends: off 20:00-09:00, allow 09:00-20:00
# - week day: off 20:00-06:00, allow 06:00-08:00, on 08:00-18:00, allow 18:00-19:00
# defined_tags            = { "Schedule.Weekend" = "0,0,0,0,0,0,0,0,*,*,*,*,*,*,*,*,*,*,*,*,0,0,0,0",
#                             "Schedule.WeekDay" = "0,0,0,0,0,*,*,1,1,1,1,1,1,1,1,1,1,1,*,*,0,0,0,0" }
# Define Lab schedule for:
# - weekends: off 20:00-09:00, allow 09:00-20:00
# - week day: off 20:00-06:00, allow 06:00-20:00
# defined_tags            = { "Schedule.Weekend" = "0,0,0,0,0,0,0,0,*,*,*,*,*,*,*,*,*,*,*,*,0,0,0,0",
#                             "Schedule.WeekDay" = "0,0,0,0,0,*,*,*,*,*,*,*,*,*,*,*,*,*,*,*,0,0,0,0" }   
tags                    = { "project" = "Training", "owner" = "Stefan Oehrli" }  # Simple key-value pair tags

# ------------------------------------------------------------------------------
# Lab Configuration
# ------------------------------------------------------------------------------
# label_prefix            = ""                            # Prefix for resource names
# environment_code        = "Lab"                         # Environment code (e.g., Lab, Prod, Test)
# numberOf_labs           = 2                             # Number of lab environments
# webserver_per_lab       = 2                             # Number of web servers per lab
# adb_per_lab             = 1                             # Number of ADBs per lab
# lab_domain              = "trivadislabs.com"            # Domain for the lab environment
# lab_def_password        = ""                            # Default admin password for resources
# lab_os_user             = "oracle"      
# hosts_file              = "etc/hosts.template"          # Content of a custom host file which has to be appended to /etc/hosts
# ssh_public_key          = ""                            # Public SSH key for accessing instances
ssh_public_key_path     = "etc/default_authorized_keys" # Path to SSH public key

# ------------------------------------------------------------------------------
# VCN Configuration
# ------------------------------------------------------------------------------
# vcn_cidr_block              = "10.0.0.0/24" # CIDR block for VCN
# internet_gateway_enabled    = true          # Create Internet Gateway
# nat_gateway_enabled         = true          # Create NAT Gateway
# service_gateway_enabled     = false         # Create Service Gateway
# private_newbits             = 2             # Subnet division for VCN
# public_netnum               = 0             # Public subnet number
# private_compute_netnum      = 1             # Private compute subnet number
# private_db_netnum           = 2             # Private DB subnet number

# ------------------------------------------------------------------------------
# Autonomous Database (ADB) Configuration
# ------------------------------------------------------------------------------
# adb_workload                = "OLTP"    # ADB workload (OLTP, DW, APEX, AJD)
# adb_version                 = "23ai"    # ADB version (e.g., 23ai, 19c)
# adb_is_dev_tier             = true      # Dev/Test tier (true) or production (false)
# adb_compute_count           = 4         # Number of OCPUs for ADB
# adb_compute_model           = "ECPU"    # Compute model for ADB (OCPU, ECPU)
# adb_data_storage_size_in_gb = 20        # Storage size for ADB in GB

# ------------------------------------------------------------------------------
# Web Server Configuration
# ------------------------------------------------------------------------------
# webserver_instance_name             = "webserver"           # Base name for web server instances
# webserver_instance_shape            = "VM.Standard.E5.Flex" # Shape for web server instances
# webserver_instance_image_id         = "OEL"                 # Custom image ID for the web server
# webserver_instance_os               = "Oracle Linux"        # Operating system for web server
# webserver_instance_os_version       = "8"                   # OS version for the web server
# webserver_instance_memory_in_gbs    = 4                     # Memory (in GB) for the web server
# webserver_instance_ocpus            = 1                     # OCPUs for the web server instance
# webserver_instance_boot_volume_size = 150                   # Boot volume size (in GB) for the web server
# webserver_instance_state            = "RUNNING"             # State of the web server (RUNNING/STOPPED)
# webserver_instance_public_ip        = false                 # Assign public IP to the web server

# ------------------------------------------------------------------------------
# Logging Configuration
# ------------------------------------------------------------------------------
# log_is_enabled                          = true          # Enable logging
# log_retention_duration                  = "90"          # Retention duration in days
# log_type                                = "SERVICE"     # Log type (SERVICE or custom)
# log_configuration_source_category       = "all"         # Log category
# log_configuration_source_service        = "flowlogs"    # Service generating logs
# log_configuration_source_source_type    = "OCISERVICE"  # Source of the logs
# --- EOF ----------------------------------------------------------------------