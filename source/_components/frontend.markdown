---
layout: page
title: "Frontend"
description: "Offers a frontend to Home Assistant."
date: 2015-12-06 21:35
sidebar: true
comments: false
sharing: true
footer: true
logo: home-assistant.png
ha_category: "Other"
---

This offers the official frontend to control Home Assistant.

```yaml
# Example configuration.yaml entry
frontend:
```

#### Themes
Starting with version 0.49 you can define themes:

Example:
```yaml
frontend:
  themes:
    happy:
      primary-color: pink
    sad:
      primary-color: blue
```

The example above defined two themes named `happy` and `sad`. For each theme you can set values for CSS variables. For a partial list of variables used by the main frontend see [ha-style.html](https://github.com/home-assistant/home-assistant-polymer/blob/master/src/resources/ha-style.html)

There are 2 themes-related services:
 - `frontend.reload_themes` - reloads theme configuration from yaml.
 - `frontend.set_theme(name)` - sets backend-preferred theme name. 
