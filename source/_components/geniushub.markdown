---
title: "Genius Hub"
description: "Instructions on how to integrate Genius Hub with Home Assistant."
logo: geniushub.png
ha_category:
  - Climate
  - Water heater
  - Sensor
  - Binary sensor
ha_release: 0.92
ha_iot_class: Local Polling
---

The `geniushub` integration links Home Assistant with your Genius Hub for controlling its Zones and Devices, and visibility of any Issues. Currently, there is no support for Zone schedules.

It uses the [geniushub-client](https://pypi.org/project/geniushub-client/) library.

### Zones

Each Zone controlled by your Genius hub will be exposed as either a:

 - `Climate` entity, for **Radiator** Zones, and
 - `Water Heater`, for **Hot Water Temperature** Zones

Other Zone types, such as **On / Off** Zones, are not currently supported.

Each such entity will report back its mode, state, setpoint and current temperature; other properties are available via its attributes (see below).

In addition, the entity's mode and setpoint can be changed. The entity's `operating_mode` can be set to one of `off`, `timer`, `on` (i.e. **Override** mode) or `eco`. The `eco` mode is a proxy for the **Footprint** mode and so is only available to **Radiator** Zones that have room sensors.

### Devices

If the Hub is directly polled using the v3 API (see below), then each Device controlled by your Genius hub will be exposed as either a:

 - `Sensor` entity with a % battery, for any Device with a battery (e.g. a Genius Valve), or
 - `Binary Sensor` entity with on/off state for any Device that is a switch (e.g. a Smart Plug)

Each such entity will report back its primary state; in addition, `assigned_zone` and `last_comms` (last communications time) are available via the entity's attributes.

### Issues

There are three `Sensor` entities that will indicate the number of **Errors**, **Warnings** and **Information** issues.

Each such entity has a state attribute that will contain a list of any such issues which can be used in automations, etc. For example:

{% raw %}
```yaml
- alias: GeniusHub Error Alerts
  trigger:
    platform: numeric_state
    entity_id: sensor.errors
    above: 0
  action:
  - service: notify.pushbullet_notifier
    data_template:
      title: "Genius Hub has errors"
      message: >-
        Genius Hub has the following {{ states('sensor.errors') }} errors:
        {{ state_attr('sensor.errors', 'error_list') }}
```
{% endraw %}

### State Attributes

Other properties are available via each entity's state attributes. For example, in the case of **Radiator** Zones/`Climate` devices:

```json
{
  "status": {
    "type": "radiator",
    "temperature": 19,
    "occupied": False,
    "override": {
      "duration": 0,
      "setpoint": 16
    }
  }
}
```

This data can be accessed in automations, etc. via a value template. For example:

{% raw %}
```yaml
value_template: "{{ state_attr('water_heater.boiler_h_w', 'status').override.setpoint }}"
```
{% endraw %}

In the specific case of **Radiator** zones with room sensors:

{% raw %}
```yaml
value_template: "{{ state_attr('climate.main_room', 'status').occupied }}"
```
{% endraw %}

## Configuration

To add your Genius Hub into your Home Assistant installation, add one of the following to your `configuration.yaml` file.

### Option 1: hub token only

 - requires a **hub token** obtained from [my.geniushub.co.uk/tokens](https://my.geniushub.co.uk/tokens)
 - uses the v1 API - which is well-documented
 - polls Heat Genius' own servers (so is slower, say ~5-10s response time)

```yaml
# Example configuration.yaml entry, using a Hub Token
geniushub:
  token: GENIUS_HUB_TOKEN
```

### Option 2: hub hostname/address with user credentials

 - requires your **username** & **password**, as used with [www.geniushub.co.uk/app](https://www.geniushub.co.uk/app)
 - uses the v3 API - unofficial, but there are additional features (e.g., battery levels)
 - polls the hub directly (so is faster, say ~1s response time)

```yaml
# Example configuration.yaml entry, directly polling the Hub
geniushub:
  host: IP_ADDRESS
  username: GENIUS_HUB_USERNAME
  password: GENIUS_HUB_PASSWORD
```

Note that if a `host` is used instead of `token`, then the `username` and `password` are also required.

{% configuration %}
token:
  description: The Hub Token of the Genius Hub.
  required: true
  type: string
host:
  description: The hostname/IP address of the Genius Hub.
  required: true
  type: string
username:
  description: Your Genius Hub username.
  required: false
  type: string
password:
  description: Your Genius Hub password.
  required: false
  type: string
{% endconfiguration %}
