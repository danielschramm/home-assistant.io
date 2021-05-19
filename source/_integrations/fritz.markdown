---
title: AVM FRITZ!Box Tools
description: Instructions on how to integrate AVM FRITZ!Box based routers into Home Assistant.
ha_category:
  - Presence Detection
  - Binary Sensor
  - Sensor
ha_release: '0.10'
ha_domain: fritz
ha_config_flow: true
ha_codeowners:
  - '@mammuth'
  - '@AaronDavidSchneider'
  - '@chemelli74'
ha_iot_class: Local Polling
ha_platforms:
  - device_tracker
  - binary_sensor
  - sensor
ha_ssdp: true
---

The AVM FRITZ!Box Tools integration allows you to control your [AVM FRITZ!Box](https://avm.de/produkte/fritzbox/) based router.

There is support for the following platform types within Home Assistant:

- **Device tracker** - presence detection by looking at connected devices.
- **Binary sensor** - connectivity status.
- **Sensor** - external IP address and uptime.

{% include integrations/config_flow.md %}

<div class='note'>
TR-064 needs to be enabled in the FRITZ!Box network settings for Home Assistant to login and read device info.
</div>

## Username

The configuration in the UI asks for a username. Starting from FRITZ!OS 7.24 the FRITZ!Box creates a random username for the admin user if you didn't set one yourself. This can be found after logging into the FRITZ!Box and visiting System -> FRITZ!Box Users -> Users. The username starts with `fritz` followed by four random numbers. Under properties on the right it says `created automatically`. Prior to FRITZ!OS 7.24 the default username was `admin`.

## Services

Currently supported services are Platform specific:

- `fritz.reconnect`
- `fritz.reboot`

### Platform Services

#### Service `fritz.reboot`

Reboot the router.

</div>

| Service data attribute | Optional | Description                                                                                                    |
| ---------------------- | -------- | -------------------------------------------------------------------------------------------------------------- |
| `entity_id`            | no       | Only act on a specific  router                                                                                 |

#### Service `fritz.reconnect`

Disconnect and reconnect the router to the Internet.
If you have a dynamic IP address, most likely it will change.

| Service data attribute | Optional | Description                                                                                                    |
| ---------------------- | -------- | -------------------------------------------------------------------------------------------------------------- |
| `entity_id`            | no       | Only act on a specific  router                                                                                 |

## Additional info

The configuration in the UI asks for a username. Starting from FRITZ!OS 7.24 the FRITZ!Box creates a random username for the admin user if you didn't set one yourself. This can be found after logging into the FRITZ!Box and visiting System -> FRITZ!Box Users -> Users. The username starts with `fritz` followed by four random numbers. Under properties on the right it says `created automatically`. Prior to FRITZ!OS 7.24 the default username was `admin`.

See the [device tracker integration page](/integrations/device_tracker/) for instructions how to configure the people to be tracked.
