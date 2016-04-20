---
layout: page
title: Feedreader
description: "Instructions how to integrate RSS feeds into Home Assistant."
date: 2016-04-18 22:00
sidebar: true
comments: false
sharing: true
footer: true
logo: rss.gif
ha_category: Thermostat
---

Add an RSS/Atom feed reader that polls feeds every hour and sends new entries into the event bus.

To use RSS feeds in your installation, add the following to your `configuration.yaml` file:

```yaml
# Example configuration.yaml entry
feedreader:
  urls:
   - https://home-assistant.io/atom.xml
   - https://github.com/blog.atom
```

Configuration variables:

- **urls** (*Required*): List of URLS for your feeds.
