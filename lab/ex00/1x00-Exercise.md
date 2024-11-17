---
title: "OCI Setup"
permalink: /lab/oci-setup/
excerpt: "Introduction to OCI, including an overview of the architecture and first login."
---
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD024 -->
<!-- markdownlint-disable MD029 -->
<!-- markdownlint-disable MD033 -->

## Exercise 00: Getting Started with OCI

This exercise introduces participants to the Oracle Cloud Infrastructure (OCI)
environment. You will log in, navigate the OCI console, explore the Cloud Shell,
and configure access to the Autonomous Database (ADB).

### Objectives

- Log in to the OCI console and navigate the environment.
- Explore the OCI Cloud Shell.
- Test access to the Autonomous Database (ADB).
- Configure network and database access for ADB.

## Environment {.unlisted .unnumbered}

Perform this exercise within the following environment:

- **Compartment:** `OCI-SEC-WS-LAB-nn`
- **Region:** Germany Central (Frankfurt)
- **OCI Console URL:** [OCI Console Frankfurt - Login](https://console.eu-frankfurt-1.oraclecloud.com){:target="_blank" rel="noopener"}

Ensure you are in the correct compartment and region. New resources, such as
Cloud Shell configurations and ADB access settings, should be created within
your designated compartment.

## Solution {.unlisted .unnumbered}

### Step 1: First Login to OCI Console

1. **Access the OCI Console**  
   Go to [Oracle Cloud Console](https://cloud.oracle.com/). Log in with your
   credentials.

2. **Explore the Console Dashboard**  
   Familiarize yourself with the main console sections:
   - **Navigation Menu**: Access services such as Compute, Networking, Storage,
     and Databases.
   - **Resource Summary**: Overview of resources within your compartment.
   - **Quick Actions**: Shortcuts to commonly used tasks like creating instances.

**Example Output:**

```text
OCI Console loaded successfully, with options for Compute, Storage, Networking,
Databases, and more.
```

### Step 2: Using the Cloud Shell

1. **Open Cloud Shell**  
   Click on the Cloud Shell icon in the top-right corner of the console. Wait
   for the shell to initialize.

2. **Test Basic Commands**  
   - Check current user details:
  
     ```bash
     oci iam user get --user-id $OCI_CLI_USER_ID
     ```

   - List available compartments:

     ```bash
     oci iam compartment list --all
     ```

**Example Output:**

```text
User details loaded successfully.
Compartment list:
- OCI-SEC-WS-LAB-01
- OCI-SEC-WS-LAB-02
...
```

### Step 3: Accessing the Autonomous Database (ADB)

1. **Navigate to Autonomous Databases**  
   Go to **Oracle Database** > **Autonomous Transaction Processing** or
   **Autonomous Data Warehouse**.

2. **Select Your Database Instance**  
   Click on your ADB instance to view its details, including connection strings,
   CPU usage, and storage information.

3. **Download Wallet for Database Connection**  
   - Click **DB Connection** and select **Download Wallet**.
   - Enter a password to secure the wallet file and save it.

**Example Output:**

```text
Wallet downloaded successfully to Wallet_<DB_NAME>.zip.
```

### Step 4: Configuring Access to Autonomous Database

1. **Upload Wallet to Cloud Shell**  
   Use the Cloud Shell upload feature to upload the wallet if it's on your local
   machine.

2. **Set Up Environment Variables**  
   Unzip the wallet and set environment variables:

   ```bash
   mkdir -p wallet
   unzip Wallet_<DB_NAME>.zip -d wallet
   export TNS_ADMIN=wallet
   ```

3. **Test Database Connection**  
   Use `sqlplus` or `sqlcl` to connect:

   ```bash
   sqlplus admin@<DB_SERVICE>
   ```

**Example Output:**

```plaintext
Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
...
SQL>
```

## Summary {.unlisted .unnumbered}

In this exercise, you:

- Logged into the OCI Console and explored its features.
- Familiarized yourself with the Cloud Shell and basic commands.
- Accessed and configured the Autonomous Database (ADB).

You are now ready to continue with the next exercise to expand your skills in
OCI security.

<!-- For Pandoc -->
- **Previous Exercise:** [Workshop Overview](#workshop-overview)
- **Next Exercise:** [Exercise 01: Key Management](#exercise-01-key-management)

<!-- For Jekyll -->
<!-- 
- **Previous Exercise:** [Workshop Overview](../README.md)
- **Next Exercise:** [Exercise 01: Key Management](../ex01/1x01-Exercise.md)
-->
