---
title: ""
permalink: /
---

<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD025 -->
<!-- markdownlint-disable MD033 -->

# Oracle Cloud Security Workshop

Welcome to the Oracle Cloud Infrastructure Security Kickstart Workshop with  
Stefan Oehrli and Martin Berger.

- [Introduction](./doc/into) to the environment and the workshop
- [Requirements](./doc/requirements) to the workshop requirements
- [Lab Environment](./doc/lab) of the workshop
- [Exercises](./lab) for the OCI Security Workshop
- [Extras](./others) with links, references, and exercise materials as PDFs

## Topics

In this workshop, we will cover essential security topics for
*Oracle Cloud Infrastructure (OCI)*. Participants will gain practical insights
and hands-on experience with tools such as Cloud Guard, Data Safe, and Security
Zones. We will also explore additional security concepts like key management,
in-transit encryption, and Web Application Firewall (WAF). By the end, you'll
have a solid understanding of OCI security best practices.

## Course Schedule

- **09:00 - 09:15**: **Welcome** - Course Overview and Lab Setup Instructions
- **09:15 - 10:30**: **Basis OCI Security** - In-Transit Encryption, Shielded Instances, Key Management
- **10:30 - 10:45**: **Coffee Break**
- **10:45 - 12:00**: **Cloud Guard** - Overview, Recipes, CIS Scans, Remediation, Alerts, and Events
- **12:00 - 13:00**: **Lunch**
- **13:00 - 14:15**: **Data Safe** - Introduction, Setup, Auditing, Data Masking, Assessments, and Alerts
- **14:15 - 14:45**: **Coffee Break**
- **14:45 - 16:00**: **Security Zones / Web Application Firewall** - Overview, Zone Management, Rulesets, and CIS Compliance
- **16:00 - 16:30**: **Wrap-Up** - Additional Resources, Next Steps, and Farewell

The lab environment is available as a Terraform configuration in the GitHub repository [oehrlis/oci-sec-ws](https://github.com/oehrlis/oci-sec-ws/tree/main/oci), or as an OCI stack [oci-sec-ws_stack.zip](https://github.com/oehrlis/oci-sec-ws/releases/download/v0.13.1/oci-sec-ws_stack.zip). You can also deploy it directly through [![Deploy to OCI](./images/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/oehrlis/oci-sec-ws/releases/download/v0.13.1/oci-sec-ws_stack.zip).
