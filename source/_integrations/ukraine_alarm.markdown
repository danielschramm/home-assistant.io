---
title: Ukraine Alarm
description: Instructions on how to integrate Ukraine Alarm within Home Assistant.
ha_category:
  - Other
ha_release: 2022.6
ha_iot_class: Cloud Polling
ha_config_flow: true
ha_codeowners:
  - '@PaulAnnekov'
ha_domain: ukraine_alarm
ha_platforms:
  - binary_sensor
ha_integration_type: integration
---

The Ukraine Alarm integration uses the [Ukraine Alarm](https://www.ukrainealarm.com/) web service to offer air-raid siren notifications. The integration will create 4 binary sensors for your selected region in Ukraine:

- Air
- Artillery
- Urban Fights
- Unknown

Siren check interval is set to 10 seconds to avoid overloading the API and still be able to react fast enough.

## Setup

To generate an Ukraine Alarm API key, go to [Ukraine Alarm APIs](https://api.ukrainealarm.com/) page, fill in a form and wait for an email with an API key.

{% include integrations/config_flow.md %}
