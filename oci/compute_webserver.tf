# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: compute_webserver.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.16
# Revision...: 0.6.2
# Purpose....: Define the web server compute resources for the LAB environment.
#              This includes the NGINX/Apache web server configuration distributed
#              across multiple lab environments using the specified instance settings.
# Notes......: The number of web servers per lab and the total number of labs are
#              dynamically calculated. Instances are distributed across availability 
#              domains, and each server is tagged for easy identification.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

resource "oci_core_instance" "webserver_instance" {
  # Create web server instances for each lab. The total number of instances is
  # calculated by multiplying the number of labs with the number of web servers per lab.
  count = var.numberOf_labs * var.webserver_per_lab

  # Assign an availability domain to each instance, cycling through the available ADs
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[count.index % length(data.oci_identity_availability_domains.ads.availability_domains)].name

  # Determine the lab environment for each instance by using `floor(count.index / var.webserver_per_lab)`.
  compartment_id = oci_identity_compartment.lab-compartment[floor(count.index / var.webserver_per_lab)].id

  # Set the display name for each instance using the lab number and the web server number within that lab.
  display_name = format("ci-%s-%s-%s-%02d-%s",
    lower(local.current_region_key),
    lower(var.environment_code),
    lower(local.resource_prefix_shortname),
    floor(count.index / var.webserver_per_lab),                                                   # Lab number (starts from 0)
    lower(format("%s%02d", var.webserver_instance_name, count.index % var.webserver_per_lab + 1)) # Web server number
  )

  # Set the desired state, tags, and other instance metadata
  state         = var.webserver_instance_state
  defined_tags  = var.defined_tags
  freeform_tags = var.tags

  # VNIC configuration for network settings (assign public or private IP, subnet, etc.)
  create_vnic_details {
    subnet_id        = oci_core_subnet.private_compute_subnet[floor(count.index / var.webserver_per_lab)].id
    assign_public_ip = var.webserver_instance_public_ip

    # Calculate the private IP by using the CIDR block and the offset within each lab.
    private_ip = cidrhost(
      cidrsubnet(var.vcn_cidr_block, var.private_newbits, var.private_compute_netnum),
      var.webserver_private_ip_offset + (count.index % var.webserver_per_lab) + 1
    )

    assign_ipv6ip             = "false"
    assign_private_dns_record = "true"
    display_name              = lower(format("%s%02d-vnic", var.webserver_instance_name, count.index % var.webserver_per_lab + 1))
    hostname_label            = lower(format("%s%02d", var.webserver_instance_name, count.index % var.webserver_per_lab + 1))
  }

  # Disable legacy instance metadata service (IMDS) for security
  instance_options {
    are_legacy_imds_endpoints_disabled = true
  }

  # Enable encryption in transit for data volume attachments
  is_pv_encryption_in_transit_enabled = true

  # Define the platform configuration (e.g., using AMD virtual machines)
  platform_config {
    is_symmetric_multi_threading_enabled = "true"
    type                                 = "AMD_VM"
  }

  # Lifecycle rule to prevent instance recreation if the image OCID changes
  lifecycle {
    ignore_changes = [source_details[0].source_id]
  }

  # Metadata for SSH keys and cloud-init script for setting up the web server
  metadata = {
    ssh_authorized_keys = local.ssh_authorized_keys
    user_data           = base64encode(file("${path.root}/cloudinit/linux_webserver_http_ol8.yaml"))
  }

  # Set the instance shape and configuration for memory and OCPUs
  shape = var.webserver_instance_shape
  shape_config {
    baseline_ocpu_utilization = "BASELINE_1_1"
    memory_in_gbs             = var.webserver_instance_memory_in_gbs
    ocpus                     = var.webserver_instance_ocpus
  }

  # Specify the source details for the instance (image ID and boot volume size)
  source_details {
    source_type             = "image"
    source_id               = local.webserver_instance_image_id
    boot_volume_size_in_gbs = var.webserver_instance_boot_volume_size
  }

  # Set timeouts for instance creation
  timeouts {
    create = "60m"
  }

  # Agent configuration to manage which monitoring and management services are enabled or disabled
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Oracle Java Management Service"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "OS Management Service Agent"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "OS Management Hub Agent"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Management Agent"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Custom Logs Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute RDMA GPU Monitoring"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Run Command"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Auto-Configuration"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Authentication"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Cloud Guard Workload Protection"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Block Volume Management"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
  }

  # Availability configuration to enable live migration and restore on failure
  availability_config {
    is_live_migration_preferred = "true"
    recovery_action             = "RESTORE_INSTANCE"
  }
}

# --- EOF ----------------------------------------------------------------------
