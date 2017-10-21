---
layout: page
title: "IKEA Trådfri (Tradfri)"
description: "Access and control your ZigBee-based IKEA Trådfri (Tradfri) devices."
date: 2017-04-12 22.04
sidebar: true
featured: true
comments: false
sharing: true
footer: true
logo: ikea.svg
ha_category: Hub
ha_iot_class: "Local Polling"
ha_release: 0.43
---

The `tradfri` component supports for the IKEA Trådfri (Tradfri) gateway. The gateway can control lights connected to it and Home Assistant will automatically discover its presence on your network.

You will be prompted to configure the gateway through the Home Assistant interface, Enter the security key when prompted and click configure

<p class='note'>
If you see an "Unable to connect" message, restart the gateway and try again. Don't forget to assign a permanent IP to your Trådfri gateway.
</p>

The gateway can also be manually configured by adding the following lines to your `configuration.yaml` file:

```yaml
# Example configuration.yaml entry
tradfri:
  host: IP_ADDRESS
  api_key: API_KEY
```

Configuration variables:

 - **host** (*Required*): The IP address or hostname of your Trådfri gateway.
 - **api_key** (*Required*): Can be found listed as Security Key on the back of the Trådfri gateway.
 - **allow_tradfri_groups** (*Optional*): (true/false) Enable this to stop Home Assistant from importing the groups defined on the Trådfri bridge.
