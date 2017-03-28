---
layout: page
title: "LIFX"
description: "Instructions how to integrate LIFX into Home Assistant."
date: 2016-01-27 08:00
sidebar: true
comments: false
sharing: true
footer: true
logo: lifx.png
ha_category: Light
ha_iot_class: "Local Push"
ha_release: 0.12
---

The `lifx` platform allows you to integrate your [LIFX](http://www.lifx.com) into Home Assistant.

_Please note, LIFX is currently not supported on Windows._

```yaml
# Example configuration.yaml entry
light:
  - platform: lifx
    server: 192.168.1.10
```
Configuration variables:

- **server** (*Optional*): Your server address. Only needed if using more than one network interface. Omit if you are unsure.
