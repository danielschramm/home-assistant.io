---
layout: page
title: "Zeroconf/Avahi/Bonjour"
description: "Exposes Home Assistant using the Zeroconf protocol."
date: 2016-04-10 18:50
sidebar: true
comments: false
sharing: true
footer: true
ha_category:
  - Network
ha_release: 0.18
---

The `zeroconf` integration will scan the network for supported devices and services. Discovered integrations will show up in the discovered section on the integrations page in the config panel. It will also make Home Assistant discoverable for other services in the network. Zeroconf is also sometimes known as Bonjour, Rendezvous, and Avahi.

Integrations can opt-in to be found by adding either [a Zeroconf section](https://developers.home-assistant.io/docs/en/next/creating_integration_manifest.html#zeroconf) or [a HomeKit section](https://developers.home-assistant.io/docs/en/next/creating_integration_manifest.html#homekit) to their manifest.json.

## {% linkable_title Configuration %}

To integrate this into Home Assistant, add the following section to your `configuration.yaml` file:

```yaml
# Example configuration.yaml entry
zeroconf:
```

## {% linkable_title Discovered Integrations %}

The following integrations are automatically discovered by the SSDP integration:

 - Axis
 - ESPHome
 - HomeKit Controller
 - LIFX
 - Trådfri
