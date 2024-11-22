# Changelog
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-configure-file { "MD024":{"allow_different_nesting": true }} -->
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased] -

### Added

### Changed

### Fixed

## [0.14.2] - 2024-11-22

### Added

- add images for exercise 08

### Changed

- replace intro slides with new contact information
- change format for download version
- rewrite exercise 08

### Fixed

- fix code in exercise 06

## [0.14.1] - 2024-11-22

### Changed

- add OCI user and password info to each environement chapter of the exercises.

## [0.14.0] - 2024-11-22

### Added

- add image pwd reset ADB
- add workshop PDF

### Changed

- simplify OS commands in exercise 00

## [0.13.1] - 2024-11-22

### Fixed

- fix policy statement in terraform config for *service cloudguard*

## [0.13.0] - 2024-11-22

### Added

- add images for adb sql action
- add step 5 Test ADB Actions in exercise 0
- add privilege *manage load-balancers*
- add privileges for WAF config
- add images for ex06
- update draft version of ex05-11

### Changed

- add information for client IP
- change ex00 to use variable an absolute path

### Fixed

- Fix link in lab overview for exercise 03 Notification
- Fix issues with *cloudguard* notification add privileges
- Fix Markdown errors

## [0.12.2] - 2024-11-21

### Fixed

- Fix issues with *cloudguard* auto remediation add privileges for service *cloudguard*
- Fix Markdown errors

## [0.12.1] - 2024-11-21

### Fixed

- fix missing privilege *manage cloud-guard-family in tenancy*
  
## [0.12.0] - 2024-11-21

### Added

- add privilege *manage ons-topic* to compartment specific policy
- add privilege *manage cloudevents-rules* to compartment specific policy
- add privilege *manage alarms* to compartment specific policy
- add privilege *read metrics* to compartment specific policy
- add draft version for exercise 06
- add draft version for exercise 07
- add draft version for exercise 08
- add draft version for exercise 09
- add draft version for exercise 10
- add draft version for exercise 11

## [0.11.0] - 2024-11-21

### Added

- add privilege to manage *data-safe-family*
- add image for exercise 00
- add images for exercise 05

### Changed

- simplify code to allow easier copy past of code
- finalizing exercise 05
- review spelling, typos and comprehensibility of exercise 05

### Fixed

- markdown errors in exercise 01

### Removed

- remove legacy section in exercise 00

## [0.10.8] - 2024-11-18

### Fixed

- fix markdown errors

## [0.10.7] - 2024-11-18

### Added

- add privilege to manage autonomous database
- add images for ex00

### Changed

- change lab exercise 00

## [0.10.6] - 2024-11-18

### Changed

- add minimum limits for random password
  
## [0.10.5] - 2024-11-17

### Fixed

- fix metadata of index.md
  
## [0.10.4] - 2024-11-17

### Fixed

- fix metadata of index.md
  
## [0.10.3] - 2024-11-17

### Fixed

- Remove duplicates in titles of jekll pages. Adjust metadata
- fix link to workshop overview
  
## [0.10.2] - 2024-11-17

### Fixed

- Update github actions for markdown comments

## [0.10.1] - 2024-11-17

### Fixed

- Fix Markdown error MD047
  
## [0.10.0] - 2024-11-17

### Added

- add MD13 exception in workshop exercise files
- add pandoc and jekll specific links in exercises
- add sed commands to process pandoc and jekll specific links in github actions

### Changed

- Change workshop table in readme.md
- add `{:target="_blank" rel="noopener"}` to the environment link for OCI
- change wording for OCI Button link

### Fixed

- add `{.unlisted .unnumbered}` to the **Solution** and **Summary** heading
  
### Removed

- remove metadata header in 1x10-Workshop

## [0.9.0] - 2024-11-17

### Added

- add draft version of Data Safe exercise 05 Data Safe Configuration and Register ADB
- add draft version of Data Safe exercise 06 Assess Database Configurations
- add draft version of Data Safe exercise 07 Assess Database Users
- add draft version of Data Safe exercise 08 Audit Database Activity
- add draft version of Data Safe exercise 09 Generate Alerts
- add draft version of Data Safe exercise 10 Discover Sensitive Data
- add draft version of Data Safe exercise 11 SQL Firewall

### Changed

- Consolidate section about *Environment*
- Consolidate structure of each exercise to include introduction, objectives
  and summary with links to previous and next exercise
- update workshop overview
- Update navigation to cover all exercises
- reorganize chapters / folders of exercises

### Fixed

- misc MD errors

### Removed

- remove unused folders

## [0.8.2] - 2024-11-15

### Fixed

- fix wrong default value for ADB version. Set it to 23ai

## [0.8.1] - 2024-11-15

### Fixed

- fix issue with id_rsa dummy file
  
## [0.8.0] - 2024-11-15

### Added

- add Data Safe slide deck
  
### Changed

- Update deploy to oci url and remove tenancy as well region
- remove default value for defined tag e.g. the scheduling tag as this is not
  generally available

## [0.7.0] - 2024-10-31

### Added

- lab for security zones
- slides for security zones
- add ingress_security_rules for port 80

### Changed

- update policies for WAF
- merge ssh keys including default ones ssh_authorized_keys

### Fixed

- fixed markdown errors

### Removed

## [0.6.4] - 2024-10-29

### Fixed

- change ssh_public_key in schema.yaml

## [0.6.3] - 2024-10-29

### Added

- add link for Lab environment to index and readme

## [0.6.2] - 2024-10-29

### Fixed

- fixed links for deploy to Oracle cloud
- fixed links in index file for workshop webpage
- fix links in main readme for github repo

## [0.6.1] - 2024-10-29

### Fixed

- Fix Markdown errors

## [0.6.0] - 2024-10-29

### Added

- add OCI overview image
- add dummy headers for future exercises

### Changed

- change language of github workflow and docs
- rewrite index and main readme files
- change lang in pandoc meta file

### Fixed

- add correct links in workshop overview
- add correct links in workshop readme

## [0.5.0] - 2024-10-28

### Added

- add dummy chapter 07 for security zones and WAF
- add deploy to oci image

### Changed

- Reorder Agenda
- moved user.md to 9x96-Appendix-F_Manual_Lab_Users.md
- rework the chapter *Lab Overview* and update doc metadata
- rework the chapter *Exercises Overview* and update doc metadata
- reorder the chapter *Key Management* and update doc metadata
- translate download chapter
- translate link chapter
- translate readme for *Workshop Extras*
- update metadata for Cloud Guard - Detector and Responder Recipes - Manual Remediation
- update metadata for Cloud Guard - Detector and Responder Recipes - Auto Remediation
- update metadata for Cloud Guard - Detector and Responder Recipes - Notification
- update navigation

## [0.4.2] - 2024-10-25

### Fixed

- fix action name issues

## [0.4.1] - 2024-10-25

### Changed

- update action verify terraform configuration

### Fixed

- fix terraform lint issues

## [0.4.0] - 2024-10-25

### Added

- add terraform configuration to create lab users, groups and policies
- added ex04 text
- add logo to terraform stack
- update build job to create stack

### Changed

- update description to show resources are created using terraform
- enhance stack output
- fix markdown errors
- move images to the central image folder

## [0.3.2] - 2024-10-24

### Added

- add new variable *webserver_private_ip_offset*

### Changed

- update compartment description
- change password length to 18 characters
- use default dhcp option for public network
- add comments to logging resource configuration
- use default security list for public network
- use default routing table for public network
- update subnets to use default resources in VCN
- update local variable resource_name, resource_name_lower, resource_shortname,
  resource_prefix_shortname
- add enable_delete to the compartment resource

### Fixed

- adb.tf fix calculation of index for compartment, db name and naming
- fix Markdown errors
- fix subnet assignments for the security lists

## [0.3.1] - 2024-10-16

### Added

- add adb resource config *adb.tf*
- add compartment resource config *compartment.tf*
- add webserver resource config *compute_webserver.tf*
- add credentials resource config *credentials.tf*
- add route resource config *route.tf*
- add vcn resource config *vcn.tf*
- add datasource config *datasource.tf*
- add cloud-init config file to install and configure apache with and without https
- add *default_authorized_keys* file and corresponding folder readme
- add *terraform.tfvars* template
- add subnets resource config *subnets.tf*
- add security resource config *security.tf*
- add subnet resource config *subnet.tf*
- add dhcp resource config *dhcp.tf*
- add provider resource config *provider.tf*
- add internet gateway resource config *internet_gateway.tf*
- add nat gateway resource config *nat_gateway.tf*
- add home region config *home_region.tf*
- add local variable config *locals.tf*
- add vcn logging config *logging.tf*
- add terraform output *outputs.tf*

### Changed

- updated variable definition *variables.tf*
- rename *local.tf* to *locals.tf*
- update OCI Stack schema file *schema.yaml*

### Fixed

- fix ADB *db_name* be be unique

### Removed

## [0.3.0] - 2024-10-16
  
### Changed

- update index for web page
- rename agenda slides
- rewrite *Workshop Introduction* chapter
- rewrite *Preface* in english

### Added

- add an agenda planing spreadsheet
- add first version of agenda slides
- add QR-Code image for web page
  
## [0.2.9] - 2024-08-16
  
### Changed

- replace marvinpinto/action-automatic-releases@latest with softprops/action-gh-release@v2

## [0.2.8] - 2024-08-16

### Added

- add default config for pages
  
### Changed

- update action version
  
### Fixed

- fix a couple of topo's
  
### Removed

- Removed logo from template configuration

## [0.2.7] - 2024-08-15

### Changed

- change action to softprops/action-gh-release@v1
  
## [0.2.6] - 2024-08-15

### Fixed

- Fix GitHub Workflow issues, migrate actions to latest version
  
### Added

- add write permission for Create a tagged release

### Changed

- change action to actions/upload-release-asset@v1

## [0.2.5] - 2024-08-15

### Fixed

- Fix GitHub Workflow issues, migrate actions to latest version

## [0.2.4] - 2024-08-15

### Fixed

- Fix GitHub Workflow issues, migrate actions to latest version

### Changed

- Remove TOC in requirements documentation

## [0.2.3] - 2024-08-15

### Fixed

- Fix GitHub Workflow issues, migrate actions to latest version

## [0.2.2] - 2024-08-15

### Fixed

- Fix GitHub Workflow issues, migrate actions to latest version (v4)
  
## [0.2.1] - 2024-08-15

### Fixed

- Fix GitHub Workflow issues, migrate actions to latest version (v4)

### Added

- add permission for *GITHUB_TOKEN*

## [0.2.0] - 2024-08-15

### Added

- add fonts folder use for pandoc PDF conversion (Fonts and documentation)
- add Accenture Logo file

### Changed

- complete update of image folder readme documentation
- complete update of doc folder readme documentation
- Update Pandoc meta data files *metadata_requirements.yml* and *metadata.yml*
  for latest release of Pandoc docker image

## [0.1.0] - 2024-08-15

### Added

- initial release *Everything has to start somewhere*. This release is based on
  DOAG 2022 [Oracle Cloud Infrastructure (OCI) Kickstart Workshop](https://github.com/oehrlis/doag2022)
- add navigation for GitHub pages
- add bin folder for scripts
- add ppt folder with initial power point presentation
- add image folder
- add other folder and files

## Release

- List of latest [releases](https://github.com/oehrlis/oci-sec-ws/releases) and [tags](https://github.com/oehrlis/oci-sec-ws/tags).
- [Unreleased](https://github.com/oehrlis/oci-sec-ws) version from main branch
