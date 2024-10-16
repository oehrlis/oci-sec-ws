<!-- markdownlint-disable MD025 -->
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD051 -->
<!-- markdownlint-configure-file { "MD013": { "tables": false } } -->
# Exercises

The exercises are grouped into individual directories and can be completed independently. Each exercise includes a brief description of the tasks as well as a solution. Additionally, scripts and other necessary resources are included with each exercise. For exercises that require software (Oracle binaries, patches) or code from other Git repositories, we provide the necessary references. All exercises are also available via the GitHub repository [oehrlis/oci-sec-ws](https://github.com/oehrlis/oci-sec-ws).

## Introduction

| ID  | Topic                            | Description                                             | Duration |
|-----|----------------------------------|---------------------------------------------------------|----------|
| 01  | [Architecture](#architektur)     | Overview of the OCI architecture for the walkthrough.    | 10 min   |
| 02  | [OCI Login](#oci-konsole-login)  | First login to Oracle Cloud Infrastructure (OCI).        | 15 min   |

**Table:** Workshop exercises for the introduction section.

## Oracle Cloud Guard

| ID  | Topic                                                   | Description                                                 | Duration |
|-----|---------------------------------------------------------|-------------------------------------------------------------|----------|
| 03  | [Overview](#vcn-basics)                                 | Introduction to Virtual Cloud Networks.                      | 15 min   |
| 04  | [Setup](#simple-compute-instance)                       | Configuration of a compute instance.                         | 15 min   |
| 05  | [CIS Scans](#cis-scans)                                 | Performing CIS scans to identify security issues.            | 20 min   |
| 06  | [Receipes](#receipes)                                   | Managing Cloud Guard security recipes.                       | 20 min   |
| 07  | [Alerting](#alerting)                                   | Setting up alerting mechanisms for security events.          | 30 min   |
| 08  | [Events](#events)                                       | Configuring event responses for detected security incidents. | 30 min   |
| 09  | [Remediation](#remediation)                             | Implementing remediation actions to resolve security issues. | 15 min   |

**Table:** Workshop exercises for Oracle Cloud Guard.

## Oracle Data Safe

| ID  | Topic                                                   | Description                                                   | Duration |
|-----|---------------------------------------------------------|----------------------------------------------------------------|----------|
| 10  | [Login](#data-safe-login)                               | Logging into Oracle Data Safe and initial setup.                | 10 min   |
| 12  | [Register ADP](#data-safe-audit)                         | Configuring auditing in Data Safe for enhanced monitoring.      | 20 min   |
| 14  | [Security Assessments](#security-assessments)           | Running security assessments to evaluate security posture.      | 20 min   |
| 15  | [Alerting](#data-safe-alerting)                         | Setting up alerting for data security violations.               | 20 min   |
| 15  | [SQL Firewall](#data-safe-alerting)                         | Setting up alerting for data security violations.               | 20 min   |
| 15  | [On-Premises Database](#data-safe-alerting)                         | Setting up alerting for data security violations.               | 20 min   |
| 13  | [Data Masking](#data-masking)                           | Applying data masking for sensitive data.                       | 20 min   |

**Table:** Workshop exercises for Oracle Data Safe.

## Security Zones

| ID  | Topic                                                   | Description                                                   | Duration |
|-----|---------------------------------------------------------|----------------------------------------------------------------|----------|
| 36  | [Overview](#security-zones-overview)                    | Introduction to Security Zones and their purpose.               | 15 min   |
| 37  | [Zones](#security-zones-setup)                          | Setting up security zones to enforce security policies.         | 20 min   |
| 38  | [Rulesets](#security-zones-rulesets)                    | Managing rulesets for security zone compliance.                 | 20 min   |
| 39  | [CIS Benchmarks](#security-zones-cis)                   | Ensuring CIS compliance within Security Zones.                  | 20 min   |

**Table:** Workshop exercises for Security Zones.

## Other Security Topics

| ID  | Topic                                                   | Description                                                   | Duration |
|-----|---------------------------------------------------------|----------------------------------------------------------------|----------|
| 20  | [In-Transit Encryption](#in-transit-encryption)         | Implementing in-transit encryption to protect data.             | 20 min   |
| 21  | [Shielded Instances](#shielded-instances)               | Setting up shielded instances for enhanced security.            | 20 min   |
| 22  | [Key Management](#key-management)                       | Configuring key management for encryption and security.         | 20 min   |

**Table:** Workshop exercises for Other Security Topics.
lab:

```bash
  - title: Cloud Guard
    children:
      - title: "Overview"
        url: /lab/cg-overview/
      - title: "Enable"
        url: /lab/cg-enable/
      - title: "CIS Scans"
        url: /lab/cg-cis-scans/
      - title: "Alerting"
        url: /lab/cg-alerting/
      - title: "Receipes"
        url: /lab/cg-receipes/
      - title: "Remediation"
        url: /lab/cg-remediation/
      - title: "Events"
        url: /lab/cg-events/

  - title: Data Safe
    children:
      - title: "Overview"
        url: /lab/ds-overview/
      - title: "Setup"
        url: /lab/ds-setup/
      - title: "Audit"
        url: /lab/ds-audit/
      - title: "Assessments"
        url: /lab/ds-assessments/
      - title: "Alerting"
        url: /lab/ds-alerting/
      - title: "SQL Firewall"
        url: /lab/ds-sql-firewall/
      - title: "Data Masking"
        url: /lab/ds-data-masking/
      - title: "On-Premises Database"
        url: /lab/ds-on-premises-db/
```
