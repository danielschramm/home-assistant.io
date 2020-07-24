---
title: Bond
description: Instructions on setting up Bond Bridge within Home Assistant.
ha_category:
  - Hub
  - Cover
  - Fan
  - Light
  - Switch
ha_iot_class: Local Pull
ha_release: 0.113
ha_domain: bond
ha_codeowners:
  - '@prystupa'
ha_config_flow: true
---

The Bond integration allows you to control appliances through your [Bond Bridge](https://bondhome.io/). Duplicates your RF remote control.

Supported devices:

- Ceiling fans
- Shades
- Fireplaces

## Configuration

To use Bond controlled devices in your installation, add your Bond hub host and access token from the integrations page.

Menu: **Configuration** -> **Integrations**.

Click on the `+` sign to add an integration and click on **Bond** (use typeahead if necessary).
After completing the configuration flow, the Bond integration will be available.
