# Changelog

All notable changes to this project will automatically be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v0.3.0 - 2026-05-07

### What's Changed

#### Features

* feat: Add VPN Gateway NAT rule support (IngressSnat/EgressSnat) with name-based cross-references from vpn_links
* feat: Add outputs for gateway IDs, BGP settings, NAT rule IDs, site IDs, and connection IDs
* feat: Add NAT rules example deployment

## v0.2.2 - 2025-10-17

### What's Changed

#### 🐛 Bug Fixes

* bug: bandwidth_mbps was missing in the main.tf file (#6) @sdevriessbp

**Full Changelog**: https://github.com/schubergphilis/terraform-azure-mcaf-vwan-s2s/compare/v0.2.1...v0.2.2

## v0.2.1 - 2025-10-10

### What's Changed

* bug: missing device model and vendor by @sdevriessbp in https://github.com/schubergphilis/terraform-azure-mcaf-vwan-s2s/pull/5

### New Contributors

* @sdevriessbp made their first contribution in https://github.com/schubergphilis/terraform-azure-mcaf-vwan-s2s/pull/5

**Full Changelog**: https://github.com/schubergphilis/terraform-azure-mcaf-vwan-s2s/compare/v0.2.0...v0.2.1

## v0.2.0 - 2025-07-07

### What's Changed

#### 🚀 Features

* feat: Fix variable references within vpn_link (#4) @esanwit

#### 🐛 Bug Fixes

* feat: Fix variable references within vpn_link (#4) @esanwit

**Full Changelog**: https://github.com/schubergphilis/terraform-azure-mcaf-vwan-s2s/compare/v0.1.0...v0.2.0
