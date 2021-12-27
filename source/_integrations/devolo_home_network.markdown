---
title: devolo Home Network
description: Instructions on how to integrate devolo Home Network devices with Home Assistant.
ha_category:
  - Sensor
ha_release: '2021.12'
ha_iot_class: Local Polling
ha_config_flow: true
ha_codeowners:
  - '@2Fake'
  - '@Shutgun'
ha_domain: devolo_home_network
ha_quality_scale: platinum
ha_platforms:
  - sensor
ha_zeroconf: true
---

The devolo Home Network integration allows you to monitor your PLC network.

{% include integrations/config_flow.md %}

## Device Types

Currently the following device types within Home Assistant are supported.

### Sensors

* Number of connected wifi clients
  * Updates every 10 seconds
  * Is enabled by default
* Number of neighbored wifi networks
  * Updates every 5 minutes
  * Is disabled by default because it runs quite long
* Number of PLC devices in the same PLC network
  * Updates every 5 minutes
  * Is disabled by default because it typically rarely changes

## Supported devolo Devices

The list of supported devolo devices depends on the device firmware and the device features. The following devices were tested running firmware 5.6.0:

* Magic 2 WiFi next
* Magic 2 WiFi 2-1
* Magic 1 WiFi mini
* Magic 1 WiFi 2-1
* dLAN 1200+ WiFi ac
* dLAN 550+ Wifi
* dLAN 550 WiFi
