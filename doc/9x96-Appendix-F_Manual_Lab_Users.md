# Appendix F: Oracle Cloud Infrastructure Users and Permissions
<!-- markdownlint-disable MD013 -->

| Resource         | Resource Name            | Remarks                                                                |
|------------------|--------------------------| -----------------------------------------------------------------------|
| Group            | grp-oci-sec-ws-lab-00    | Group to manage IAM                                                    |
| Policy           | pol-oci-sec-ws           | Policy to manage IAM, set on root compartment level                    |
| Policy           | pol-oci-sec-ws-lab-00    | Policy to manage IAM, set on user compartment level                    |

## POL-OCI-SEC-WS -Level Tenancy

```BASH
Allow group grp-oci-sec-ws-lab-00 to use cloud-guard-config in tenancy
Allow group grp-oci-sec-ws-lab-00 to use cloud-guard-config in tenancy
Allow group grp-oci-sec-ws-lab-00 to use ons-topics in tenancy
Allow group grp-oci-sec-ws-lab-00 to manage ons-subscriptions in tenancy
Allow group grp-oci-sec-ws-lab-00 to manage cloudevents-rules in tenancy
Allow group grp-oci-sec-ws-lab-00 to use cloud-shell in tenancy
Allow group grp-oci-sec-ws-lab-00 to read app-catalog-listing in tenancy
Allow group grp-oci-sec-ws-lab-00 to manage vaults in tenancy
Allow group grp-oci-sec-ws-lab-00 to manage keys in tenancy
Allow group grp-oci-sec-ws-lab-00 to manage secret-family in tenancy
Allow group grp-oci-sec-ws-lab-00 to use key-delegate in tenancy
```

## POL-OCI-SEC-WS-LAB-00 - Level Compartment TRAINING

```BASH
Allow group grp-oci-sec-ws-lab-00 to manage buckets in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage objects in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage cloud-guard-family in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage cloud-guard-config in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage security-zone in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage security-recipe in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage security-zone in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage security-recipe in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to use ons-topic in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage cloudevents-rules in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage vaults in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage keys in in compartment OCI-SEC-WS-LAB-00 
Allow group grp-oci-sec-ws-lab-00 to manage secret-family in in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to manage instance-family in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to use volume-family in compartment OCI-SEC-WS-LAB-00
Allow group grp-oci-sec-ws-lab-00 to use virtual-network-family in compartment OCI-SEC-WS-LAB-00
```
