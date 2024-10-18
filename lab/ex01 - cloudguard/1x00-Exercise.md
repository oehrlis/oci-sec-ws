<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

# Cloud Guard - Detector and Responder Recipes

## Environments {.unlisted .unnumbered}

If not explicitly stated, the exercises are usually performed on the following
environment:

- **Compartment:** OCI-SEC-WS-LAB-nn
- **Region:** Switzerland North (Zurich)
- **OCI Console URL:** <a href="https://console.eu-zurich-1.oraclecloud.com" target="_blank" rel="noopener">OCI Konsole Zurich - Login</a>

Verify in OCI console you selected the correct region and for Cloud Guard you are in your compartment. New resources like recipes, object storage buckets etc. are always created on your compartment.

## Exercise 01

### Exercise Goals {.unlisted .unnumbered}

Create a detector recipe to recognize public Object Storage buckets.

### Tasks {.unlisted .unnumbered}

- Clone existing Oracle managed receipes
- Create a new target to observer your compartment objects
- Create a object storage bucket and change visibility to public
- Verify alert
