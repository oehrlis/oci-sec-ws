---
title: "Workshop"
permalink: /doc/workshop/
excerpt: "Introduction to the OCI Security Workshop (OCI-SEC-WS)"
---
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD025 -->
<!-- markdownlint-disable MD051 -->
<!-- markdownlint-configure-file { "MD013": { "tables": false } } -->
# Workshop Overview

The exercises are structured to guide participants through various security
configurations and best practices on Oracle Cloud Infrastructure. Each exercise
includes a task description, objectives, and solutions, along with any required
resources and scripts.

## Workshop Roadmap

| ID | Topic              | Exercise                                                                                | Description                                                                          | Duration |
|----|--------------------|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|----------|
| 00 | OCI Setup          | [Getting Started with OCI](#exercise-00-getting-started-with-oci)                       | Introduction to OCI, including an overview of the architecture and first login.      | 10 min   |
| 01 | Basic OCI Security | [Key Management](#exercise-01-key-management)                                           | Create and manage encryption keys within a customer-managed key vault.               | 30 min   |
| 02 | Cloud Guard        | [Manual Remediation](#exercise-02-manual-remediation)                                   | Configure manual remediation for detected security risks.                            | 45 min   |
| 03 | Cloud Guard        | [Auto Remediation](#exercise-03-auto-remediation)                                       | Automate responses to detected security vulnerabilities.                             | 40 min   |
| 04 | Cloud Guard        | [Notification Setup](#exercise-04-notification-setup)                                   | Set up notifications to monitor and alert on security-related events.                | 25 min   |
| 05 | Data Safe          | [Data Safe Configuration and Register ADB](#exercise-05-configuration-and-register-adb) | Initial setup of Oracle Data Safe, including registration of an Autonomous Database. | 10 min   |
| 06 | Data Safe          | [Assess Database Configurations](#exercise-06-assess-database-configurations)           | Use Oracle Data Safe to assess database configurations for compliance.               | 10 min   |
| 07 | Data Safe          | [Assess Database Users](#exercise-07-assess-database-users)                             | Review and analyze database user accounts with Oracle Data Safe.                     | 10 min   |
| 08 | Data Safe          | [Audit Database Activity](#exercise-08-audit-database-activity)                         | Monitor and audit database activity for enhanced security visibility.                | 15 min   |
| 09 | Data Safe          | [Generate Alerts](#exercise-09-generate-alerts)                                         | Configure and generate alerts based on Oracle Data Safe findings.                    | 15 min   |
| 10 | Data Safe          | [Discover Sensitive Data](#exercise-10-discover-sensitive-data)                         | Identify and classify sensitive data within the database using Oracle Data Safe.     | 10 min   |
| 11 | Data Safe          | [SQL Firewall](#exercise-11-sql-firewall)                                               | Implement SQL Firewall to manage and restrict SQL execution within the database.     | 10 min   |
| 12 | Security Zones     | [Security Zones](#exercise-12-create-security-zone)                                     | Configure Security Zones to enforce compliance and security policies.                | 15 min   |
| 13 | Security Zones     | [Web Application Firewall (WAF)](#exercise-13-setup-waf-for-xss-detection)              | Set up and test the Web Application Firewall to protect applications from threats.   | 30 min   |

**Table:** Summary of Workshop Exercises.

Each exercise is designed to be self-contained, allowing participants to complete them independently. Detailed solutions are provided, along with links to the GitHub repository for scripts and additional resources: [oehrlis/oci-sec-ws](https://github.com/oehrlis/oci-sec-ws).
