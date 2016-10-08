---
layout: page
title: "Nest Binary Sensor"
description: "Instructions how to integrate Nest binary sensors within Home Assistant."
date: 2016-01-26 08:00
sidebar: true
comments: false
sharing: true
footer: true
logo: nest_thermostat.png
ha_category: Binary Sensor
ha_release: pre 0.7
---


The `nest` binary sensor platform let you monitor various states of a thermostat from [Nest](https://nest.com).

<p class='note'>
You must have the [Nest component](/components/nest/) configured to use this sensors.
</p>

To set it up, add the following information to your `configuration.yaml` file:

```yaml
binary_sensor:
  - platform: nest
    monitored_conditions:
      - 'fan'
      - 'hvac_ac_state'
       'hvac_heater_state'
      - 'hvac_aux_heater_state'
      - 'hvac_heat_x2_state'
      - 'hvac_heat_x3_state'
      - 'hvac_alt_heat_state'
      - 'hvac_alt_heat_x2_state'
      - 'hvac_emer_heat_state'
      - 'online'
```

Configuration variables:

- **monitored_conditions** array (*Required*): States to monitor.
  - 'fan'
  - 'hvac_ac_state'
  - 'hvac_aux_heater_state'
  - 'hvac_heat_x2_state'
  - 'hvac_heat_x3_state'
  - 'hvac_alt_heat_state'
  - 'hvac_alt_heat_x2_state'
  - 'hvac_emer_heat_state'
  - 'online'
- **scan_interval** (*Optional*): Interval in seconds to scan.

