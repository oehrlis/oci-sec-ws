# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: variables.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.16
# Revision...: 0.10.1
# Purpose....: Define variables for the terraform module for setting up the 
#              TVDLAB environment. Variables control the configuration of OCI 
#              resources such as Virtual Cloud Networks (VCN), Compute Instances, 
#              Autonomous Databases, Web Servers, and Lab Environments.
# Notes......: The variables are structured for flexibility and reusability, 
#              making the deployment process dynamic and customizable.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Generic Variables
# ------------------------------------------------------------------------------
# These variables define the authentication and general parameters for interacting 
# with the Oracle Cloud Infrastructure (OCI) API and creating resources within a tenancy.

variable "user_ocid" {
  description = "The OCID of the OCI user used for authentication and API access."
  type        = string
  default     = ""
}

variable "fingerprint" {
  description = "The fingerprint of the public key used for API signing."
  type        = string
  default     = ""
}

variable "private_key_path" {
  description = "Path to the private key file used for signing requests to the OCI API."
  type        = string
  default     = ""
}

variable "tenancy_ocid" {
  description = "The OCID of the tenancy where the resources will be created."
  type        = string
}

variable "region" {
  description = "The OCI region where the infrastructure resources will be deployed (e.g., 'us-ashburn-1')."
  type        = string
}

variable "compartment_ocid" {
  description = "The OCID of the compartment where resources will be provisioned."
  type        = string
}

variable "resource_name" {
  description = "User-friendly base name for resources. If not provided, the name is derived from the compartment name."
  type        = string
  default     = ""
}

variable "defined_tags" {
  description = "Predefined tags for the resources, used for scheduling or governance purposes."
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "Freeform key-value pairs used to tag OCI resources."
  type        = map(any)
  default     = {}
}

# ------------------------------------------------------------------------------
# Lab Configuration
# ------------------------------------------------------------------------------
# Variables that define the overall configuration for the lab environment, including
# the number of labs, web servers, autonomous databases, and other lab-specific settings.

variable "label_prefix" {
  description = "Optional prefix added to all resource names for identification or grouping purposes."
  type        = string
  default     = ""
}

variable "environment_code" {
  description = "Short code representing the environment (e.g., Lab, Prod, Test), used for resource names and tagging."
  type        = string
  default     = "Lab"
}

variable "numberOf_labs" {
  description = "The number of lab environments to be created. Each lab will have its own set of resources such as VCNs and compute instances."
  type        = number
  default     = 1
}

variable "webserver_per_lab" {
  description = "Number of web servers to provision in each lab environment."
  type        = number
  default     = 2
}

variable "adb_per_lab" {
  description = "Number of Autonomous Databases (ADB) to provision in each lab environment."
  type        = number
  default     = 1
}

variable "lab_domain" {
  description = "Domain name for the LAB environment. This is used for internal DNS setup."
  type        = string
  default     = "trivadislabs.com"
}

variable "lab_dns_hostnum" {
  description = "The host number for the LAB DNS server. This number is used to build the IP address using cidrhost function"
  type        = number
  default     = 4
}

variable "lab_private_dns" {
  description = "A private DNS IP address for the training environment"
  type        = string
  default     = "default"
}

variable "custom_dns_servers" {
  description = "List of custom DNS server"
  type        = list(string)
  default     = []
}

variable "lab_public_dns" {
  description = "A public DNS IP address for the training environment"
  type        = string
  default     = "8.8.8.8"
}

variable "lab_def_password" {
  description = "Default password for administrative accounts (e.g., Windows admin, Oracle DB, directory services) used in the LAB environment."
  type        = string
  default     = ""
}

variable "ssh_public_key" {
  description = "Public SSH key content used for accessing the compute instances. Can be provided directly or via a file path."
  type        = string
  default     = ""
}

variable "ssh_public_key_path" {
  description = "File path to the public SSH key used for accessing the compute instances."
  type        = string
  default     = ""
}

# ------------------------------------------------------------------------------
# VCN Configuration
# ------------------------------------------------------------------------------
# Variables related to the configuration of Virtual Cloud Networks (VCN) and associated
# gateways and subnets in the LAB environment.

variable "vcn_cidr_block" {
  description = "The CIDR block for the Virtual Cloud Network (VCN) in the LAB environment."
  type        = string
  default     = "10.0.0.0/24"
}

variable "internet_gateway_enabled" {
  description = "Whether to provision an Internet Gateway in the VCN, allowing public access to certain resources."
  type        = bool
  default     = true
}

variable "nat_gateway_enabled" {
  description = "Whether to provision a NAT Gateway, enabling instances in private subnets to access the internet for outbound traffic."
  type        = bool
  default     = true
}

variable "service_gateway_enabled" {
  description = "Whether to provision a Service Gateway for private access to OCI services (e.g., Object Storage) from the VCN."
  type        = bool
  default     = false
}

variable "private_newbits" {
  description = "Number of additional subnet bits to divide the VCN CIDR block into smaller subnets (e.g., divide /24 into /26)."
  type        = number
  default     = 2
}

variable "public_netnum" {
  description = "Subnet number for the public subnet within the VCN."
  type        = number
  default     = 0
}

variable "private_compute_netnum" {
  description = "Subnet number for the private compute subnet within the VCN."
  type        = number
  default     = 1
}

variable "private_db_netnum" {
  description = "Subnet number for the private database subnet within the VCN."
  type        = number
  default     = 2
}

# ------------------------------------------------------------------------------
# Autonomous Database (ADB) Configuration
# ------------------------------------------------------------------------------
# Variables that control the configuration of Autonomous Databases (ADB) in the LAB environment.

variable "adb_workload" {
  description = "Specifies the workload type for the Autonomous Database (OLTP, DW, APEX, AJD). Defaults to OLTP."
  type        = string
  default     = "OLTP"
  validation {
    condition     = contains(["OLTP", "DW", "APEX", "AJD"], var.adb_workload)
    error_message = "The adb_workload must be one of the following: OLTP, DW, APEX, or AJD."
  }
}

variable "adb_version" {
  description = "Version of Oracle Autonomous Database to use (e.g., 23ai, 19c)."
  type        = string
  default     = "23ai"
}

variable "adb_is_dev_tier" {
  description = "Whether the ADB should be in the development tier (true) or production tier (false)."
  type        = bool
  default     = true
}

variable "adb_compute_count" {
  description = "Number of OCPUs (or ECPUs) to allocate to the Autonomous Database."
  type        = number
  default     = 4
}

variable "adb_compute_model" {
  description = "Specifies the compute model for the ADB (either 'OCPU' or 'ECPU')."
  type        = string
  default     = "ECPU"
}

variable "adb_data_storage_size_in_gb" {
  description = "Amount of data storage allocated to the Autonomous Database, in gigabytes."
  type        = number
  default     = 20
}

# ------------------------------------------------------------------------------
# Web Server Configuration
# ------------------------------------------------------------------------------
# Variables controlling the configuration of web server instances in the LAB environment.

variable "webserver_instance_name" {
  description = "Base name for the web server instances created in the LAB environment."
  type        = string
  default     = "webserver"
}

variable "webserver_instance_shape" {
  description = "The shape (instance type) of the web server instance (e.g., VM.Standard.E5.Flex)."
  type        = string
  default     = "VM.Standard.E5.Flex"
}

variable "webserver_instance_image_id" {
  description = "Custom image ID for the web server instance. Defaults to Oracle Enterprise Linux (OEL) if not provided."
  type        = string
  default     = "OEL"
}

variable "webserver_instance_os" {
  description = "Operating system for the web server instances (e.g., Oracle Linux, Ubuntu)."
  type        = string
  default     = "Oracle Linux"
}

variable "webserver_instance_os_version" {
  description = "Version of the operating system to be installed on the web server instances."
  type        = string
  default     = "8"
}

variable "webserver_instance_memory_in_gbs" {
  description = "Amount of memory (in GB) allocated to the web server instance."
  type        = number
  default     = 4
}

variable "webserver_instance_ocpus" {
  description = "Number of OCPUs allocated to the web server instance."
  type        = number
  default     = 1
}

variable "webserver_instance_boot_volume_size" {
  description = "Size of the boot volume (in GB) for the web server instance."
  type        = number
  default     = 150
}

variable "webserver_instance_state" {
  description = "Desired state of the web server instance (RUNNING or STOPPED)."
  type        = string
  default     = "RUNNING"
}

variable "webserver_instance_public_ip" {
  description = "Whether to assign a public IP to the web server instance."
  type        = bool
  default     = false
}

variable "webserver_private_ip_offset" {
  description = "The starting offset for webserver private IPs in the subnet"
  type        = number
  default     = 10 # Start IP assignment at .10 in the subnet
}
# ------------------------------------------------------------------------------
# Logging Configuration
# ------------------------------------------------------------------------------
# Variables related to configuring logging for the LAB environment.

variable "log_is_enabled" {
  description = "Flag to indicate whether logging is enabled for the resources."
  type        = bool
  default     = true
}

variable "log_retention_duration" {
  description = "Duration for retaining logs, specified in days (e.g., 30, 60, 90)."
  type        = string
  default     = "90"
}

variable "log_type" {
  description = "Type of log generated (SERVICE for OCI services, or custom)."
  type        = string
  default     = "SERVICE"
}

variable "log_configuration_source_category" {
  description = "Category of the log source (e.g., 'all' for all logs)."
  type        = string
  default     = "all"
}

variable "log_configuration_source_service" {
  description = "Service generating the log (e.g., 'flowlogs' for VCN flow logs)."
  type        = string
  default     = "flowlogs"
}

variable "log_configuration_source_source_type" {
  description = "Source of the log (e.g., 'OCISERVICE')."
  type        = string
  default     = "OCISERVICE"
}

# --- EOF ----------------------------------------------------------------------
