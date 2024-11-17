---
title: "Workshop Overview"
permalink: /lab/
excerpt: "Workshop Overview of the OCI Security Workshop (OCI-SEC-WS)"
---
<!-- markdownlint-disable MD025 -->
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD051 -->
<!-- markdownlint-configure-file { "MD013": { "tables": false } } -->

The exercises are structured to guide participants through various security
configurations and best practices on Oracle Cloud Infrastructure. Each exercise
includes a task description, objectives, and solutions, along with any required
resources and scripts.

## Workshop Roadmap

| ID | Topic              | Exercise                                                            | Description                                                                          | Duration |
|----|--------------------|---------------------------------------------------------------------|--------------------------------------------------------------------------------------|----------|
| 00 | OCI Setup          | [Getting Started with OCI](./ex00/1x00-Exercise.md)                 | Introduction to OCI, including an overview of the architecture and first login.      | 10 min   |
| 01 | Basic OCI Security | [Key Management](./ex01/1x01-Exercise.md)                           | Create and manage encryption keys within a customer-managed key vault.               | 30 min   |
| 02 | Cloud Guard        | [Manual Remediation](./ex02/2x02-Exercise.md)                       | Configure manual remediation for detected security risks.                            | 45 min   |
| 03 | Cloud Guard        | [Auto Remediation](./ex02/2x03-Exercise.md)                         | Automate responses to detected security vulnerabilities.                             | 40 min   |
| 04 | Cloud Guard        | [Notification Setup](./ex02/2x03-Exercise.md)                       | Set up notifications to monitor and alert on security-related events.                | 25 min   |
| 05 | Data Safe          | [Data Safe Configuration and Register ADB](./ex03/3x05-Exercise.md) | Initial setup of Oracle Data Safe, including registration of an Autonomous Database. | 10 min   |
| 06 | Data Safe          | [Assess Database Configurations](./ex03/3x05-Exercise.md)           | Use Oracle Data Safe to assess database configurations for compliance.               | 10 min   |
| 07 | Data Safe          | [Assess Database Users](./ex03/3x06-Exercise.md)                    | Review and analyze database user accounts with Oracle Data Safe.                     | 10 min   |
| 08 | Data Safe          | [Audit Database Activity](./ex03/3x07-Exercise.md)                  | Monitor and audit database activity for enhanced security visibility.                | 15 min   |
| 09 | Data Safe          | [Generate Alerts](./ex03/3x09-Exercise.md)                          | Configure and generate alerts based on Oracle Data Safe findings.                    | 15 min   |
| 10 | Data Safe          | [Discover Sensitive Data](./ex03/3x10-Exercise.md)                  | Identify and classify sensitive data within the database using Oracle Data Safe.     | 10 min   |
| 11 | Data Safe          | [SQL Firewall](./ex03/3x11-Exercise.md)                             | Implement SQL Firewall to manage and restrict SQL execution within the database.     | 10 min   |
| 12 | Security Zones     | [Security Zones](./ex04/4x12-Exercise.md)                           | Configure Security Zones to enforce compliance and security policies.                | 15 min   |
| 13 | Security Zones     | [Web Application Firewall (WAF)](./ex04/4x13-Exercise.md)           | Set up and test the Web Application Firewall to protect applications from threats.   | 30 min   |

**Table:** Summary of Workshop Exercises.

Each exercise is designed to be self-contained, allowing participants to complete them independently. Detailed solutions are provided, along with links to the GitHub repository for scripts and additional resources: [oehrlis/oci-sec-ws](https://github.com/oehrlis/oci-sec-ws).
