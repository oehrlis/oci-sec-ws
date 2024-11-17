# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: credentials.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@oradba.ch
# Editor.....: Stefan Oehrli
# Date.......: 2024.10.23
# Revision...: 0.10.4
# Purpose....: Define and manage credentials for the LAB environment, including 
#              SSH key generation and secure password creation.
# Notes......: The SSH key and password are used across multiple resources such
#              as compute instances and databases to ensure secure access.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# Generate an RSA SSH private key for use in the LAB environment.
resource "tls_private_key" "lab_ssh_key" {
  algorithm = "RSA" # RSA algorithm for the key pair.
  rsa_bits  = 2048  # Key size of 2048 bits, providing a secure key.
}


resource "local_sensitive_file" "lab_ssh_key_file" {
  content  = tls_private_key.lab_ssh_key.private_key_pem
  filename = "${path.root}/etc/id_rsa"
}
# Create a random password for use in the LAB environment.
resource "random_password" "lab_password" {
  length  = 18   # Length of the password set to 16 characters.
  lower   = true # Include lowercase letters.
  upper   = true # Include uppercase letters.
  numeric = true # Include numbers.
  special = true # Include special characters.

  # Override the default special characters allowed in the password to include
  # only specific symbols for compatibility.
  override_special = ".-_+"
}

# --- EOF ----------------------------------------------------------------------
