---
layout: page
title: "Bluetooth Tracker"
description: "Instructions how to integrate bluetooth tracking within Home Assistant."
date: 2016-04-10 17:24
sidebar: true
comments: false
sharing: true
footer: true
logo: bluetooth.png
ha_category: Presence Detection
ha_iot_class: "Local Poll"
ha_release: 0.18
---

This tracker discovers new devices on boot and tracks bluetooth devices periodically based on interval_seconds value. Devices discovered are stored with 'bt_' as the prefix for device mac in `known_devices.yaml`.

<p class='note'>
Requires PyBluez. If you are on raspbian, make sure you first install `bluetooth` and `libbluetooth-dev` by running `sudo apt install bluetooth libbluetooth-dev`
</p>

To use the Bluetooth tracker in your installation, add the following to your `configuration.yaml` file:

```yaml
device_tracker:
  platform: bluetooth_tracker
```

For additional configuration variables check the [Device tracker page](/components/device_tracker/).
