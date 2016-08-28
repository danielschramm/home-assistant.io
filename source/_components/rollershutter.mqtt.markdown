---
layout: page
title: "MQTT Rollershutter"
description: "Instructions how to integrate MQTT motorized devices into Home Assistant."
date: 2015-12-01 12:00
sidebar: true
comments: false
sharing: true
footer: true
logo: mqtt.png
ha_category: Deprecated
ha_release: 0.9
ha_iot_class: depends
---

<p class='note warning'>
**This platform has been deprecated in favor of a "[cover](/components/cover.mqtt/)" platform and will be removed in the future. Please use the cover platform.**
</p>

The `mqtt` rollershutter platform enables the possibility to control an MQTT rollershutter. The device state will be updated only after receiving the a new state from `state_topic`. If these messages are published with RETAIN flag, the MQTT device will receive an instant state update after subscription and will start with correct state. Otherwise, the initial state will be `unknown`.

There is a state attribute that stores the relative position of the device, where 0% means the device is `closed` and all other intermediate positions means the device is `open`.

To enable this platform, add the following lines to your `configuration.yaml`:

```yaml
# Example configuration.yaml entry
rollershutter:
  platform: mqtt
  name: "Bedroom Rollershutter"
  state_topic: "home/bedroom/rollershutter"
  command_topic: "home/bedroom/rollershutter/set"
  qos: 0
  payload_up: "OPEN"
  payload_down: "CLOSE"
  payload_stop: "STOP"
  value_template: '{% raw %}{{ value.x }}{% endraw %}'
```

Configuration variables:

- **command_topic** (*Required*): The MQTT topic to publish commands to control the rollershutter.

- **name** (*Optional*): The name of the rollershutter. Default is 'MQTT Rollershutter'.
- **state_topic** (*Optional*): The MQTT topic subscribed to receive state updates. If not defined, the rollershutter will be stateless, that is, no information about current position or open/closed. If defined, the received payload must be a integer between 0 and 100, that represents the percentage for fully closed and fully open, respectively.
- **qos** (*Optional*): The maximum QoS level of the state topic. Default is 0. This QoS will also be used to publishing messages.
- **payload_up** (*Optional*): The payload to open the rollershutter. Default is "OPEN".
- **payload_down** (*Optional*): The payload to close the rollershutter. Default is "CLOSE".
- **payload_stop** (*Optional*): The payload to stop the rollershutter. Default is "STOP".
- **value_template** (*Optional*): Defines a [template](/topics/templating/) to extract a value from the payload.
