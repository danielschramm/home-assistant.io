---
title: NINA
description: Instructions on how to set up NINA warnings in Home Assistant.
ha_category:
  - Binary Sensor
ha_release: 2022.2
ha_iot_class: Cloud Polling
ha_config_flow: true
ha_codeowners:
  - '@DeerMaximum'
ha_domain: nina
ha_platforms:
  - binary_sensor
---

The [NINA](https://www.bbk.bund.de/DE/Warnung-Vorsorge/Warn-App-NINA/warn-app-nina_node.html) integration displays warnings from the [Bundesamt für Bevölkerungsschutz und Katastrophenhilfe](https://www.bbk.bund.de/) in Germany.

For each county/city it creates warning slots that change to Unsafe when warnings are present. The text of the warning and the metadata are stored in the attributes of the slots.

{% include integrations/config_flow.md %}
