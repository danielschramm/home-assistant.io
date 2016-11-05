---
layout: page
title: "Yeelight Wifi Bulb"
description: "Instructions how to setup Yeelight Wifi devices within Home Assistant."
date: 2016-10-29
sidebar: true
comments: false
sharing: true
footer: true
logo: yeelight.png
ha_category: Light
ha_release: 0.32
---

The `yeelight` light platform allows you to control your Yeelight Wifi bulbs with Home Assistant.

To enable those lights, add the following lines to your `configuration.yaml` file:

```yaml
# Example configuration.yaml entry
  - platform: yeelight
    devices:
      192.168.1.25:
        name: palier
```

Configuration variables:

- **ip** (*Required*): IP(s) of your wifi bulbs
- **name** (*Optional*): A friendly name for the device.

<p class='note'>
Before trying to control your light through Home Assistant, you have to setup your bulb using Yeelight app. ( [Android](https://play.google.com/store/apps/details?id=com.yeelight.cherry&hl=fr), [IOS](https://itunes.apple.com/us/app/yeelight/id977125608?mt=8) ).
In the bulb property, you have to enable "Developer Mode"
Determine your bulb ip (using router, software, ping ...)
</p>

<p class='note warning'>
Tests are only made with a YLDP03YL model. Because it's the only hardware developer owns. If you have bugs with another kind of model, you could open an issue on [Home Assitant Github](https://github.com/home-assistant/home-assistant)
</p>


