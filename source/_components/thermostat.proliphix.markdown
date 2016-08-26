---
layout: page
title: "Proliphix Thermostat"
description: "Instructions how to integrate Proliphix thermostats within Home Assistant."
date: 2016-01-15 08:00
sidebar: true
comments: false
sharing: true
footer: true
logo: proliphix.png
ha_category: Thermostat
ha_release: 0.11
---

**This platform has been deprecated in favor of a "climate" platform and will be removed in the future. Please use the climate platform.**

The `proliphix` thermostat platform let you control [Proliphix](http://www.proliphix.com) thermostat from Home Assistant.

Currently supported and tested thermostats:

- NT10e

To set it up, add the following information to your `configuration.yaml` file:

```yaml
thermostat:
  platform: proliphix
  host: IP_ADDRESS
  username: YOUR_USERNAME
  password: YOUR_PASSWORD
```

Configuration variables:

- **host** (*Required*): Adress of your thermostat, eg. 192.168.1.32
- **username** (*Required*): Username for the thermostat.
- **password** (*Required*): Password for the thermostat.

The Proliphix NT Thermostat series are ethernet connected thermostats. They have a local HTTP interface that is based on get/set
of OID values. A complete collection of the API is available in this [API documentation](https://github.com/sdague/thermostat.rb/blob/master/docs/PDP_API_R1_11.pdf).

