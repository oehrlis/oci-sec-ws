---
title: "Cloud Guard"
permalink: /lab/cg-auto-remediationediation/
excerpt: "ClAutomate responses to detected security vulnerabilities."
---
<!-- markdownlint-disable MD024 -->
<!-- markdownlint-disable MD025 -->
<!-- markdownlint-disable MD033 -->

## Exercise 03: Auto Remediation

In this exercise, you will enable auto-remediation in Cloud Guard to automatically resolve issues with public Object Storage buckets. Building on the detector settings from the previous exercise, you will configure a responder recipe to change the visibility of public buckets to private automatically.

### Objectives

- Add a responder recipe to the target.
- Enable auto-remediation to automatically resolve public bucket issues.
- Test the setup by creating a new bucket and setting its visibility to public, verifying that Cloud Guard automatically changes it to private.

## Environment {.unlisted .unnumbered}

Perform this exercise within the following environment:

- **Compartment:** `OCI-SEC-WS-LAB-nn`
- **Region:** Germany Central (Frankfurt)
- **OCI Console URL:**  
  [OCI Console Frankfurt - Login](https://console.eu-frankfurt-1.oraclecloud.com){:target="_blank" rel="noopener"}

Ensure you are in the correct compartment and region. New resources, such as Cloud Shell configurations and ADB access settings, should be created within your designated compartment.

## Solution

Login as User XYZ in OCI console and go to _Cloud Guard Overview_. Ensure you
have select the proper compartment in from the dropdown list on left side.

![>> overview](../../images/screenshot-cloud-guard-overview_ex02.jpg)

### Enable Auto Resolve

#### Add Responder recipe to Target

We must add the responder recipe to target configuration.

Cloud Guard -> Configuration -> Targets

![>> step_1](../../images/screenshot-cloud-guard-auto-resolve_1.jpg)

Select your created target an scroll at the bottom.

![>> step_2](../../images/screenshot-cloud-guard-auto-resolve_2.jpg)

In section _Configuration_ und _Responder recipes_, add recipe. Select your
responder receive from dropdown list and press _Add recipes_. Do not select the
Oracle managed recipe as you have no privileges there to change any settings.

![>> step_3](../../images/screenshot-cloud-guard-auto-resolve_3.jpg)

#### Enable Auto resolve

Select the fresh added Responder recipe. Edit the entry for _Make Bucket Private_
by click on the three dots and _Edit_.

![>> step_4](../../images/screenshot-cloud-guard-auto-resolve_4.jpg)

You can ignore the alert about privileges as these settings are done on top
compartment level. We set condition

- In section _Setting_, activated _Execute automatically_.
- Enable checkbox to confirm the execution.
- Set Conditional Group for parameter region to eu-zurich_1

![>> step_5](../../images/screenshot-cloud-guard-auto-resolve_5.jpg)
![>> step_6](../../images/screenshot-cloud-guard-auto-resolve_6.jpg)

Press _Save_ at the bottom.

#### Verify Auto-Resolve by Creating a Public Bucket

Repeat the steps from the previous lab to create a new bucket.

#### Create Bucket

Add basic information and description. Call it _private_bucket_. Ensure you are
in the correct compartment. If not, select your compartment in left side dropdown
menu.

Press _Create Bucket_.

- Set Bucket Name to _public-bucket_ and let other settings as per default.

![>> step7](../../images/screenshot-cloud-guard-auto-resolve_7.jpg)

Press _Create_ at the bottom.

#### Edit Visibility

Edit created bucket by click on the three dots on bucket line -> Edit Visibility.

![>> step_8](../../images/screenshot-cloud-guard-auto-resolve_8.jpg)

Press _Save Changes_ at the bottom.

#### Verification

The bucket is set to public and marked by a yellow triangle.

![>> step_9](../../images/screenshot-cloud-guard-auto-resolve_9.jpg)

#### Verify Auto Resolving

After a couple of seconds, you can verify the Responder activity. There are two
new entries to make the bucket private Cloud Guard -> Alerts -> Responder activity

![>> step_10](../../images/screenshot-cloud-guard-auto-resolve_10.jpg)

#### Verification

The visibility for your created Object Storage bucket has automatically changed
now to Private.

Storage -> Buckets

![>> step_11](../../images/screenshot-cloud-guard-auto-resolve_11.jpg)

## Summary

In this exercise, you:

- Added a responder recipe to your Cloud Guard target.
- Enabled auto-remediation to handle public bucket visibility issues.
- Tested auto-remediation by creating a public bucket and verifying that Cloud Guard automatically set it to private.

You are now ready to continue with the next exercise, where you will configure Cloud Guard notifications for security alerts.

- **Previous Exercise:** [Exercise 02: Manual Remediation](#exercise-02-manual-remediation)
- **Next Exercise:** [Exercise 04: Notification Setup](#exercise-04-notification-setup)
