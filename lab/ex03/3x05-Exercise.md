---
title: ""
permalink: /lab/ds-config/
excerpt: "Initial setup of Oracle Data Safe, including registration of an Autonomous Database."
---
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD024 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

## Exercise 05: Configuration and Register ADB

In this exercise, you will set up Oracle Data Safe to enhance the security of
your Autonomous Database (ADB) by enabling monitoring and data protection
features. You'll begin by configuring Data Safe and then proceed to register
your ADB instance for secure management.

### Objectives

- Configure Oracle Data Safe for your environment.
- Register an Autonomous Database (ADB) with Data Safe.

## Environment {.unlisted .unnumbered}

Perform this exercise within the following environment:

- **Compartment:** `OCI-SEC-WS-LAB-nn`
- **Region:** Germany Central (Frankfurt)
- **OCI Console URL:** [OCI Console Frankfurt - Login](https://console.eu-frankfurt-1.oraclecloud.com){:target="_blank" rel="noopener"}

Ensure you are in the correct compartment and region. New resources, such as
Cloud Shell configurations and ADB access settings, should be created within
your designated compartment.

## Solution {.unlisted .unnumbered}

Login as User XYZ in OCI console. Ensure you have select the proper compartment in from the dropdown list on left side.

Oracle Database -> Data Safe - Database Security -> Overview

1. Start the *Autonomous Database* registration wizard.

![>> step_1](../../images/ex05_ds_register01.png)

2. Select the *Autonomous Database* for your compartment, as example compartment *SOE-DEV-OCI-SEC-WS-LAB-00*.

![>> step_2](../../images/ex05_ds_register02.png)

3. Proceed to next step by selecting next and finalize registration

![>> step_3](../../images/ex05_ds_register03.png)

4. Registration of *Autonomous Database* will take a while

![>> step_4](../../images/ex05_ds_register04.png)

5. As soon as the *Autonomous Database* is registered it is visible in the dashboard

Oracle Database -> Data Safe - Database Security -> Dashboard

![>> step_5](../../images/ex05_ds_register05.png)

## Summary {.unlisted .unnumbered}

In this exercise, you:

- Configured Oracle Data Safe to enable security features for database monitoring.
- Successfully registered an Autonomous Database (ADB) with Data Safe for secure
- management.

You are now ready to continue with the next exercise, where you will explore how
to assess database configurations for compliance and best practices.

<!-- For Pandoc -->
- **Previous Exercise:** [Exercise 04: Notification Setup](#exercise-04-notification-setup)
- **Next Exercise:** [Exercise 06: Assess Database Configurations](#exercise-06-assess-database-configurations)

<!-- For Jekyll -->
<!-- 
- **Previous Exercise:** [Exercise 04: Notification Setup](../ex02/2x04-Exercise.md)
- **Next Exercise:** [Exercise 06: Assess Database Configurations](../ex03/3x06-Exercise.md)
-->
