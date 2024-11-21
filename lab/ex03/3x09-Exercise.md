---
title: ""
permalink: /lab/ds-alerts/
excerpt: "Configure and generate alerts based on Oracle Data Safe findings."
---
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD024 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

## Exercise 09: Generate Alerts

In this exercise, you will configure Oracle Data Safe to generate alerts for
specific activities or events within your Autonomous Database (ADB). Setting up
alerts helps you stay informed about critical actions, security incidents, and
potential threats in real-time.

### Objectives

- Configure alert settings in Oracle Data Safe.
- Set up rules to trigger alerts for specific database events.
- Test the alerting mechanism to ensure notifications are received for relevant
  actions.

## Environment {.unlisted .unnumbered}

Perform this exercise within the following environment:

- **Compartment:** `OCI-SEC-WS-LAB-nn`
- **Region:** Germany Central (Frankfurt)
- **OCI Console URL:** [OCI Console Frankfurt - Login](https://console.eu-frankfurt-1.oraclecloud.com){:target="_blank" rel="noopener"}

Ensure you are in the correct compartment and region. New resources, such as
Cloud Shell configurations and ADB access settings, should be created within
your designated compartment.

## Solution {.unlisted .unnumbered}

### Step 1: Configure Alert Settings in Oracle Data Safe

1. **Access the Data Safe Dashboard**:
   - Navigate to **Data Safe** → **Alerts** in the OCI Console.

2. **Enable Alerts for the Target Database**:
   - Select the target Autonomous Database (ADB) from the list.
   - If alerts are not already enabled, click **Enable Alerts** to activate the alerting mechanism for the database.

3. **Define Notification Settings**:
   - Navigate to the **Notification Settings** section.
   - Add or confirm the notification endpoint (e.g., email address or OCI Notification Service topic) where alerts will be sent.
   - Save your changes.

### Step 2: Set Up Rules to Trigger Alerts for Specific Database Events

1. **Go to Alert Rules**:
   - In the **Alerts** section, navigate to the **Rules** tab.

2. **Create a New Alert Rule**:
   - Click **Create Rule** to define a custom alert.
   - Specify the following:
     - **Event Type**: Select the type of event to monitor, such as:
       - Failed logins.
       - Schema changes.
       - Privilege escalations.
     - **Severity Level**: Assign a severity (e.g., High, Medium, Low) for the alert.
     - **Description**: Provide a brief description of the rule for context.

3. **Save the Rule**:
   - Ensure the rule is active and associated with the target ADB.

### Step 3: Test the Alerting Mechanism

1. **Simulate a Database Event**:
   - Perform an action on the target database that should trigger the alert.
     - Example 1: Attempt a failed login using an invalid user/password combination:

       ```bash
       sqlplus invalid_user/invalid_password@your_database_alias
       ```

     - Example 2: Make a schema change such as creating a new table:

      ```sql
       CREATE TABLE test_table (id NUMBER);
       ```

2. **Monitor for Alerts**:
   - Check the **Alert Logs** in the Data Safe Dashboard to ensure the event was captured.
   - Confirm that the alert was triggered based on your defined rule.

3. **Verify Notification Delivery**:
   - Check your email inbox or the notification endpoint for the alert message.
   - The notification should include details about the event, such as:
     - **Event Type**: Type of action that triggered the alert.
     - **Timestamp**: When the event occurred.
     - **Target Database**: The affected database.

4. **Troubleshoot if Necessary**:
   - If no alert or notification is received:
     - Verify that the rule is active and correctly configured.
     - Check the notification endpoint for proper setup.

## Summary {.unlisted .unnumbered}

In this exercise, you:

- Configured alert settings in Oracle Data Safe to monitor key database events.
- Defined custom alert rules to trigger notifications for specific actions, such as failed logins or schema changes.
- Tested the alerting mechanism by simulating database events and verifying notification delivery.

You are now ready to proceed to the next exercise, where you will explore data discovery and masking features in Oracle Data Safe.

<!-- For Pandoc -->
- **Previous Exercise:** [Exercise 08: Audit Database Activity](#exercise-08-database-activity)
- **Next Exercise:** [Exercise 10: Discover Sensitive Data](#exercise-10-discover-sensitive-data)

<!-- For Jekyll -->
<!-- 
- **Previous Exercise:** [Exercise 08: Audit Database Activity](../ex03/3x08-Exercise.md)
- **Next Exercise:** [Exercise 10: Discover Sensitive Data](../ex03/3x10-Exercise.md)
-->
