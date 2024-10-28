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

### Removed

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
