---
title: ""
permalink: /lab/ds-sensitive/
excerpt: "Identify and classify sensitive data within the database using Oracle Data Safe."
---
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD024 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

## Exercise 10: Discover Sensitive Data

In this exercise, you will use Oracle Data Safe to identify and classify
sensitive data within your Autonomous Database (ADB). This process helps ensure
data privacy and compliance by discovering personally identifiable information
(PII) and other sensitive data types.

### Objectives

- Run a data discovery scan in Oracle Data Safe to locate sensitive data.
- Review the results to understand the types and locations of sensitive data
  within the database.

## Environment {.unlisted .unnumbered}

Perform this exercise within the following environment:

- **Compartment:** `OCI-SEC-WS-LAB-nn`
- **Region:** Germany Central (Frankfurt)
- **OCI Console URL:** [OCI Console Frankfurt - Login](https://console.eu-frankfurt-1.oraclecloud.com){:target="_blank" rel="noopener"}

Ensure you are in the correct compartment and region. New resources, such as
Cloud Shell configurations and ADB access settings, should be created within
your designated compartment.

## Solution {.unlisted .unnumbered}

Here’s the draft solution for **Exercise 10: Discover Sensitive Data**:

---

## Solution {.unlisted .unnumbered}

### Step 1: Run a Data Discovery Scan in Oracle Data Safe

1. **Access the Data Safe Dashboard**:
   - Navigate to **Data Safe** → **Data Discovery** in the OCI Console.

2. **Create a New Data Discovery Job**:
   - Click **Create Data Discovery Job** to initiate a new scan.
   - Select the target database (your registered ADB) from the list.

3. **Configure the Discovery Scan**:
   - Provide a meaningful name for the job, such as `Sensitive_Data_Discovery_Job`.
   - Select the scope of the scan:
     - **Schemas**: Choose specific schemas or scan all schemas.
     - **Columns**: Specify columns or allow automatic detection based on sensitive data models.
   - Enable **Include Predefined Sensitive Types** to use built-in data classifications (e.g., credit card numbers, social security numbers).

4. **Start the Scan**:
   - Review the job configuration and click **Start**.
   - Monitor the progress of the scan on the **Job Details** page.

---

### Step 2: Review the Results

1. **Access the Completed Scan Report**:
   - Once the scan is complete, go to **Data Discovery** → **Job Results**.
   - Select the completed job to view its details.

2. **Analyze the Sensitive Data Findings**:
   - Review the categorized results, such as:
     - **Sensitive Data Types**: Identify the types of sensitive data detected (e.g., Personally Identifiable Information, Financial Data).
     - **Locations**: View the schemas, tables, and columns where sensitive data is located.

3. **Understand the Risk Levels**:
   - Each finding is assigned a **Risk Level** (e.g., High, Medium, Low) based on the sensitivity and exposure of the data.
   - Focus on high-risk findings for immediate action.

4. **Export the Report** (Optional):
   - If required, export the discovery scan results in **PDF** or **CSV** format for further review or compliance reporting.

---

### Optional: Plan for Data Protection

1. **Evaluate Data Masking**:
   - Based on the discovery results, consider applying **data masking** to protect sensitive data in non-production environments.

2. **Review User Access**:
   - Cross-reference sensitive data locations with user privileges to ensure only authorized users can access high-risk data.

## Summary {.unlisted .unnumbered}

In this exercise, you:

- Ran a data discovery scan in Oracle Data Safe to locate sensitive data in your Autonomous Database.
- Reviewed the results to identify sensitive data types and their locations within the database.
- Analyzed risk levels associated with sensitive data to understand potential vulnerabilities.

You are now ready to proceed to the next exercise, where you will explore additional data protection features, such as masking sensitive data.

<!-- For Pandoc -->
- **Previous Exercise:** [Exercise 09: Generate Alerts](#exercise-09-generate-alerts)
- **Next Exercise:** [Exercise 11: SQL Firewall](#exercise-11-sql-firewall)

<!-- For Jekyll -->
<!-- 
- **Previous Exercise:** [Exercise 09: Generate Alerts](../ex03/3x09-Exercise.md)
- **Next Exercise:** [Exercise 11: SQL Firewall](../ex03/3x11-Exercise.md)
-->
