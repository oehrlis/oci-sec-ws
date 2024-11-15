<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD051 -->
<!-- markdownlint-configure-file { "MD013": { "tables": false } } -->
# Workshop Overview

The exercises are structured to guide participants through various security
configurations and best practices on Oracle Cloud Infrastructure. Each exercise
includes a task description, objectives, and solutions, along with any required
resources and scripts.

## Workshop Roadmap

| ID | Topic                                                                                                  | Description                                                                            | Duration |
|----|--------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|----------|
| 00 | [OCI Overview & Login](#introduction-to-the-lab-environment)                                           | Overview of the OCI architecture and first login to Oracle Cloud Infrastructure (OCI). | 25 min   |
| 01 | [Key Management](#key-management)                                                                      | Create and manage customer-managed encryption keys.                                    | 30 min   |
| 02 | [Cloud Guard - Manual Remediation](#cloud-guard---detector-and-responder-recipes---manual-remediation) | Configure manual remediation for detected risks.                                       | 45 min   |
| 03 | [Cloud Guard - Auto Remediation](#cloud-guard---detector-and-responder-recipes---auto-remediation)     | Automate responses to detected security vulnerabilities.                               | 40 min   |
| 04 | [Cloud Guard - Notification Setup](#cloud-guard---detector-and-responder-recipes---notification)       | Set up notifications to monitor and alert on security.                                 | 25 min   |
| 05 | [Data Safe Configuration](#data-safe)                                                                  | Initial setup and configuration of Oracle Data Safe.                                   | 45 min   |
| 06 | [Security Zones](#security-zones)                                                                      | Configure Security Zones to enforce compliance.                                        | 15 min   |
| 07 | [Web Application Firewall (WAF)](#web-application-firewall-waf)                                        | Set up and test the Web Application Firewall.                                          | 30 min   |

**Table:** Summary of Workshop Exercises.

Each exercise is designed to be self-contained, allowing participants to complete them independently. Detailed solutions are provided, along with links to the GitHub repository for scripts and additional resources: [oehrlis/oci-sec-ws](https://github.com/oehrlis/oci-sec-ws).


| ID   | Exercise ID | Chapter           | Exercise                       | URL / Slug                      | Description                                                                            | Duration |
|------|-------------|-------------------|--------------------------------|---------------------------------|----------------------------------------------------------------------------------------|----------|
| ex00 | 00          | OCI Setup         | Getting Started with OCI       | /lab/oci-setup                  | Introduction to OCI, including an overview of the architecture and first login.         | 10 min   |
| ex01 | 01          | Basic OCI Security| Key Management                 | /lab/bs-key-management          | Create and manage encryption keys within a customer-managed key vault.                  | 30 min   |
| ex02 | 02          | Cloud Guard       | Manual Remediation             | /lab/cg-manual-remediation      | Configure manual remediation for detected security risks.                              | 45 min   |
| ex02 | 03          | Cloud Guard       | Auto Remediation               | /lab/cg-auto-remediation        | Automate responses to detected security vulnerabilities.                               | 40 min   |
| ex02 | 04          | Cloud Guard       | Notification Setup             | /lab/cg-notification-setup      | Set up notifications to monitor and alert on security-related events.                  | 25 min   |
| ex03 | 05          | Data Safe         | Configuration and Register ADB | /lab/ds-config                  | Initial setup of Oracle Data Safe, including registration of an Autonomous Database.    | 10 min   |
| ex03 | 06          | Data Safe         | Assess Database Configurations | /lab/ds-config-assess           | Use Oracle Data Safe to assess database configurations for compliance.                 | 10 min   |
| ex03 | 07          | Data Safe         | Assess Database Users          | /lab/ds-user-assess             | Review and analyze database user accounts with Oracle Data Safe.                       | 10 min   |
| ex03 | 08          | Data Safe         | Audit Database Activity        | /lab/ds-audit                   | Monitor and audit database activity for enhanced security visibility.                  | 15 min   |
| ex03 | 09          | Data Safe         | Generate Alerts                | /lab/ds-alerts                  | Configure and generate alerts based on Oracle Data Safe findings.                      | 15 min   |
| ex03 | 10          | Data Safe         | Discover Sensitive Data        | /lab/ds-sensitive               | Identify and classify sensitive data within the database using Oracle Data Safe.       | 10 min   |
| ex03 | 11          | Data Safe         | SQL Firewall                   | /lab/ds-sql-firewall            | Implement SQL Firewall to manage and restrict SQL execution within the database.       | 10 min   |
| ex04 | 12          | Security Zones    | Security Zones                 | /lab/sz-zones                   | Configure Security Zones to enforce compliance and security policies.                  | 15 min   |
| ex04 | 13          | Security Zones    | Web Application Firewall (WAF) | /lab/sz-waf                     | Set up and test the Web Application Firewall to protect applications from threats.     | 30 min   |
