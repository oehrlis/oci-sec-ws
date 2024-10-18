<!-- markdownlint-disable MD013 -->
# Oracle Cloud Infrastructure Users and Permissions

| Resource         | Resource Name            | Remarks                                                                |
|------------------|--------------------------| -----------------------------------------------------------------------|
| Group            | grp-oci-sec-ws-lab-00    | Group to manage IAM                                                    |
| Policy           | pol-oci-sec-ws           | Policy to manage IAM, set on root compartment level                    |
| Policy           | pol-oci-sec-ws-lab-00    | Policy to manage IAM, set on user compartment level                    |

## POL-OCI-SEC-WS -Level Tenancy

```BASH
Allow group grp-oci-sec-ws-lab-00 to use cloud-guard-config in tenancy
Allow group grp-oci-sec-ws-lab-00 to use cloud-guard-config in tenancy
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
```
