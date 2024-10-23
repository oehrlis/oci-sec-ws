<!-- markdownlint-disable MD024 -->
<!-- markdownlint-disable MD029 -->
<!-- markdownlint-disable MD033 -->

# Key Management
## Environments {.unlisted .unnumbered}

If not explicitly stated, the exercises are usually performed on the following
environment:

- **Compartment:** OCI-SEC-WS-LAB-nn
- **Region:** Switzerland North (Zurich)
- **OCI Console URL:**
  <a href="https://console.eu-zurich-1.oraclecloud.com" target="_blank" rel="noopener">
  OCI Konsole Zurich - Login</a>

Verify in OCI console you selected the correct region and for Cloud Guard you are
in your compartment. New resources like recipes, object storage buckets etc.,
are always created on your compartment.

## Exercise 02

### Exercise Goals {.unlisted .unnumbered}

We create a Vault to store a Mater encryption key to change the Oracle provide key on Object storage object to a Customer Manage Key.

### Tasks {.unlisted .unnumbered}

- Create Vault

## Solution

Login as User XYZ in OCI console. Ensure you have select the proper compartment
in from the dropdown list on left side.

Identity -> Security -> Key Management & Secret Management -> Vault


### Create Vault and Keys

#### Vault

1. Create a Vault
Do NOT create a PRIVATE VAULT. Set name according compartment name, as example vault-oci-sec-ws-lab-00 for compartment OCI-SEC-WS-LAB-00.

![>> step_1](images/screenshot-vault_create_1.jpg)

2. Verify  create Vault is in state Active.

![>> step_2](images/screenshot-vault_create_2.jpg)

3. Select th created Vault to add a Master Encryption Key. _Create Key_.

![>> step_3](images/screenshot-vault_create_3.jpg)

4. Select Protection Mode _Software_, use Key Shape: Algorithm and Key Shape: Length as per default. _Create Key_.

![>> step_4](images/screenshot-vault_create_4.jpg)

5. Verify Master Encryption Key is in State _Enabled_.

![>> step_5](images/screenshot-vault_create_5.jpg)