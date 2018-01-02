---
layout: page
title: "MQTT HVAC"
description: "Instructions how to integrate MQTT HVAC into Home Assistant."
date: 2017-07-31 19:59
sidebar: true
comments: false
sharing: true
footer: true
logo: heat-control.png
ha_category: Climate
ha_release: 0.55
ha_iot_class: "Local Polling"
---

The `mqtt` climate platform lets you control your MQTT enabled HVAC devices.

The platform currently works in optimistic mode, which means it does not obtain states from MQTT topics, but it sends and remembers control commands.

It uses a sensor under the hood to obtain the current temperature.

```yaml
# Example configuration.yaml entry
climate:
  - platform: mqtt
    name: Study
    current_temperature_topic: /sensors/hvac_study/current_temp
    temperature_command_topic: /sensors/hvac_study/target_temp
```

{% configuration %}
name:
  description: The name of the HVAC.
  required: false
  type: string
  default: MQTT HVAC
qos:
  description: The maximum QoS level to be used when receiving and publishing messages.
  required: false
  type: integer
  default: 0
retain:
  description: Defines if published messages should have the retain flag set.
  required: false
  type: boolean
  default: false
send_if_off:
  description: "Set to `false` to suppress sending of all MQTT messages when the current mode is `Off`."
  required: false
  type: boolean
  default: true
initial:
  description: Set the initial target temperature.
  required: false
  type: number
  default: 21
payload_on:
  description: The payload that represents enabled state.
  required: false
  type: string
  default: ON
payload_off:
  description: The payload that represents disabled state.
  required: false
  type: string
  default: OFF
availability_topic:
  description: The MQTT topic subscribed to receive availability (online/offline) updates.
  required: false
  type: string
payload_available:
  description: The payload that represents the available state.
  required: false
  type: string
  default: online
payload_not_available:
  description: The payload that represents the unavailable state.
  required: false
  type: string
  default: offline
current_temperature_topic:
  description: The MQTT topic on which to listen for the current temperature.
  required: false
  type: string
power_command_topic:
  description: The MQTT topic to publish commands to change the power state. This is useful if your device has a separate power toggle in addition to mode.
  required: false
  type: string
mode_command_topic:
  description: The MQTT topic to publish commands to change the HVAC operation mode.
  required: false
  type: string
mode_state_topic:
  description: The MQTT topic to subscribe for changes of the HVAC operation mode. If this is not set, the operation mode works in optimistic mode (see below).
  required: false
  type: string
temperature_command_topic:
  description: The MQTT topic to publish commands to change the target temperature.
  required: false
  type: string
temperature_state_topic:
  description: The MQTT topic to subscribe for changes in the target temperature. If this is not set, the target temperature works in optimistic mode (see below).
  required: false
  type: string
fan_mode_command_topic:
  description: The MQTT topic to publish commands to change the fan mode.
  required: false
  type: string
fan_mode_state_topic:
  description: The MQTT topic to subscribe for changes of the HVAC fan mode. If this is not set, the fan mode works in optimistic mode (see below).
  required: false
  type: string
swing_mode_command_topic:
  description: The MQTT topic to publish commands to change the swing mode.
  required: false
  type: string
swing_mode_state_topic:
  description: The MQTT topic to subscribe for changes of the HVAC swing mode. If this is not set, the swing mode works in optimistic mode (see below).
  required: false
  type: string
away_mode_command_topic:
  description: The MQTT topic to publish commands to change the away mode.
  required: false
  type: string
away_mode_state_topic:
  description: The MQTT topic to subscribe for changes of the HVAC away mode. If this is not set, the away mode works in optimistic mode (see below).
  required: false
  type: string
hold_command_topic:
  description: The MQTT topic to publish commands to change the hold mode.
  required: false
  type: string
hold_state_topic:
  description: The MQTT topic to subscribe for changes of the HVAC hold mode. If this is not set, the hold mode works in optimistic mode (see below).
  required: false
  type: string
aux_command_topic:
  description: The MQTT topic to publish commands to switch auxiliary heat.
  required: false
  type: string
aux_state_topic:
  description: The MQTT topic to subscribe for changes of the auxiliary heat mode. If this is not set, the auxiliary heat mode works in optimistic mode (see below).
  required: false
  type: string
{% endconfiguration %}

#### Optimistic mode

If a property works in *optimistic mode* (when the corresponding state topic is not set), home assistant will assume that any state changes published to the command topics did work and change the internal state of the entity immediately after publishing to the command topic. If it does not work in optimistic mode, the internal state of the entity is only updated when the requested update is confirmed by the device through the state topic.

### {% linkable_title Example %}

A full configuration example looks like the one below.

```yaml
# Full example configuration.yaml entry
climate:
  - platform: mqtt
    name: Study
    modes:
      - off
      - cool
      - fan_only
    swing_modes:
      - on
      - off
    fan_modes:
      - high
      - medium
      - low
    power_command_topic: "study/ac/power/set"
    mode_command_topic: "study/ac/mode/set"
    temperature_command_topic: "study/ac/temperature/set"
    fan_mode_command_topic: "study/ac/fan/set"
    swing_mode_command_topic: "study/ac/swing/set"
```
