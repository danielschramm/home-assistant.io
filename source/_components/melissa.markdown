---
layout: page
title: "Melissa Climate"
description: "Instructions how to integrate Melissa Climate into Home Assistant."
date: 2017-01-05 17:30
sidebar: true
comments: false
sharing: true
footer: true
logo: mclimate.png
ha_category: Hub
featured: false
ha_release: 0.63
ha_iot_class: "Cloud Polling"
---

The `Melissa` component is the main component to connect to a [Melissa Climate](http://seemelissa.com/) A/C control.

To set the Melissa component up, add the following information to your `configuration.yaml` file:

```yaml
# Example configuration.yaml entry
melissa:
  username: <email adress>
  password: ********
```

{% configuration %}
  username:
    description: The username for accessing your Melissa account.
    required: true
    type: string
  password:
    description: The password for accessing your Melissa account.
    required: true
    type: string
{% endconfiguration %}
