---
title: ""
permalink: /lab/ds-sql-firewall/
excerpt: "Implement SQL Firewall to manage and restrict SQL execution within the database."
---
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD024 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

## Exercise 11: SQL Firewall

In this exercise, you will configure the SQL Firewall in Oracle Data Safe to
control and monitor SQL queries executed in your Autonomous Database (ADB). This
feature helps enhance database security by defining rules that restrict
unauthorized or potentially harmful SQL statements.

### Objectives

- Set up the SQL Firewall in Oracle Data Safe.
- Define rules to allow or block specific SQL statements.
- Test the SQL Firewall by executing queries to verify that the rules are enforced.

## Environment {.unlisted .unnumbered}

Perform this exercise within the following environment:

- **Compartment:** `OCI-SEC-WS-LAB-nn`
- **Region:** Germany Central (Frankfurt)
- **OCI Console URL:** [OCI Console Frankfurt - Login](https://console.eu-frankfurt-1.oraclecloud.com){:target="_blank" rel="noopener"}

Ensure you are in the correct compartment and region. New resources, such as
Cloud Shell configurations and ADB access settings, should be created within
your designated compartment.

## Solution {.unlisted .unnumbered}

### Step 1: Set Up the SQL Firewall in Oracle Data Safe

1. **Access the Data Safe Dashboard**:
   - Navigate to **Data Safe** → **SQL Firewall** in the OCI Console.

2. **Enable SQL Firewall for the Target Database**:
   - Select the target database (your registered ADB) from the list.
   - If SQL Firewall is not already enabled, click **Enable SQL Firewall**.
   - Confirm the activation to enable SQL monitoring and protection.

3. **Define Initial SQL Activity Profile**:
   - Navigate to the **Activity Profiles** tab.
   - Click **Generate Profile** to create a baseline of SQL activity for the target database.
   - Select the duration for collecting SQL activity (e.g., 1 hour, 1 day).
   - Wait for the profile generation to complete.

### Step 2: Define Rules to Allow or Block Specific SQL Statements

1. **Go to SQL Firewall Rules**:
   - Navigate to the **Rules** tab in the SQL Firewall section.

2. **Create a New Rule**:
   - Click **Create Rule** to define a custom SQL Firewall rule.
   - Specify the following:
     - **Rule Type**:
       - **Allow**: Permit specific SQL statements.
       - **Block**: Deny specific SQL statements.
     - **SQL Statement or Pattern**: Define the SQL statements or patterns to match (e.g., `SELECT * FROM sensitive_table` or `%DELETE%`).
     - **User or Role**: (Optional) Apply the rule to specific users or roles.

3. **Save the Rule**:
   - Ensure the rule is active and associated with the target database.

### Step 3: Test the SQL Firewall by Executing Queries

1. **Connect to the Target Database**:
   - Use a SQL client (e.g., SQL*Plus or SQL Developer) or the OCI Cloud Shell to connect to the database:

     ```bash
     sqlplus admin@your_database_alias
     ```

2. **Test Allowed Queries**:
   - Execute queries that are explicitly allowed by your SQL Firewall rules:

     ```sql
     SELECT * FROM employees;
     ```

   - Confirm that these queries are executed successfully.

3. **Test Blocked Queries**:
   - Execute queries that should be blocked based on your rules:

     ```sql
     DELETE FROM sensitive_table WHERE id = 1;
     ```

   - Verify that the query is blocked, and an error or log entry is generated.

4. **Verify Logs and Alerts**:
   - Return to the **SQL Firewall Dashboard** in Data Safe.
   - Review the logs to confirm that the blocked queries were recorded.
   - Check if any alerts were triggered for the blocked SQL statements.

## Summary {.unlisted .unnumbered}

In this exercise, you:

- Enabled and set up the SQL Firewall in Oracle Data Safe to monitor and protect SQL activity.
- Created rules to allow or block specific SQL statements based on security requirements.
- Tested the SQL Firewall by executing queries and verifying that the defined rules were enforced.

You have now completed the Data Safe exercises, enhancing your database security
capabilities. Continue to explore other security features in Oracle Cloud
Infrastructure.

<!-- For Pandoc -->
- **Previous Exercise:** [Exercise 10: Discover Sensitive Data](#exercise-10-discover-sensitive-data)
- **Next Exercise:** [Exercise 12: Security Zones](#exercise-12-create-security-zone)

<!-- For Jekyll -->
<!-- 
- **Previous Exercise:** [Exercise 10: Discover Sensitive Data](../ex03/3x10-Exercise.md)
- **Next Exercise:** [Exercise 12: Security Zones](../ex04/4x12-Exercise.md)
-->
