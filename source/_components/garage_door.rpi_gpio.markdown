---
layout: page
title: "Raspberry Pi Garage door"
description: "Instructions how to setup the Raspberry Pi garage doors within Home Assistant."
date: 2016-02-12 07:00
sidebar: true
comments: false
sharing: true
footer: true
logo: raspberry-pi.png
ha_category: Garage Door
ha_release: 0.23
---

This platform allows you to use a Raspberry PI to control your Garage door.

It uses two pins on the Raspberry Pi. 
- The `state_pin` will detect if the door is closed, and
- the `relay_pin` will trigger the door to open or close.

Although you do not need AndrewsHilliday's software controller when you run Home Assistant, he has written clear instructions on how to hook your garage door & sensors up to your Raspberry Pi, which can be found [here](https://github.com/andrewshilliday/garage-door-controller#hardware-setup).

Example configuration entry:

```yaml
garage_door:
  platform: rpi_gpio
  doors:
    - relay_pin: 10
      state_pin: 11
      name: 'Left door'
    - relay_pin: 12
      state_pin: 13
      name: 'Right door'
```


