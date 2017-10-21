---
layout: page
title: "KNX"
description: "Instructions on how to integrate KNX components with Home Assistant."
date: 2016-06-08 12:00
sidebar: true
comments: false
sharing: true
footer: true
logo: knx.png
ha_category: Hub
ha_release: 0.24
ha_iot_class: "Local Polling"
---

Overview
--------

The [KNX](http://www.knx.org) integration for Home Assistant allows you to connect to a KNX/IP devices.

The component requires a local KNX/IP interface like the [Weinzierl 730](http://www.weinzierl.de/index.php/en/all-knx/knx-devices-en/knx-ip-interface-730-en). Through this, it will send and receive commands to and from other devices to the KNX bus.

There is currently support for the following device types within Home Assistant:
 
- [Binary Sensor](/components/binary_sensor.knx)
- [Cover](/components/cover.knx)
- [Sensor](/components/sensor.knx)
- [Switch](/components/switch.knx)
- [Light](/components/light.knx)
- [Thermostat](/components/climate.knx)
- [Notify](/components/notify.knx)

Configuration
--------------

To use your KNX in your installation, add the following lines to your `configuration.yaml` file:

```yaml
knx:
```

Optional, recommended for large KNX installations (>100 devices) and/or if you want to use the XKNX abstraction also for other scripted tools outside HASS:

```yaml
knx:
  config_file: '/path/to/xknx.yaml'
```
* **config_file**: (*Optional*) path for xknx configuration file.

If the auto detection of the KNX/IP device does not work you can specify ip/port of the tunneling device:

```yaml 
knx:
  tunneling:
    host: '192.168.2.23'
    port: 3671
    local_ip: '192.168.2.109'
```
* **host**: Host of the KNX/IP tunneling device
* **port**: Port of the KNX/IP tunneling device
* **local_ip**: IP of the local interface

Explicit connection to a KNX/IP routing device:

```yaml
knx:
  config_file: '/path/to/xknx.yaml'
  routing:
     local_ip: '192.168.2.109'
```
* **local_ip**: local ip of interface (which should be used for multicasting)

```yaml
knx:
    fire_event: True
    fire_event_filter: ["1/0/*", "6/2,3,4-6/*"]
```

* **fire_event** (*Optional*): If set to True, platform will write all received KNX messages to event bus
* **fire_event_filter** (*Optional*): If `fire_event` is set `fire_event_filter` has to be specified. `fire_event_filter` defines a list of patterns for filtering KNX addresses. Only telegrams which match this pattern are sent to the HASS event bus. 

* **state_updater** (*Optional*): The component will collect the current state of each configured device from the KNX bus to display it correctly within Home-Assistant. Set this option to False to prevent this behaviour.

Service
-------

In order to directly interact with the KNX bus, you can now use the following service:

```
Domain: knx
Service: send 
Service Data: {"address": "1/0/15", "payload": 0}
```

* **address**: KNX group address
* **payload**: Payload, either an integer or an array of integers



Known issues:
-------------

Due to lame multicast support the routing abstraction and the gateway scanner
only work with python >=3.5.



