---
layout: page
title: "Z-Wave Devices - Adding and Removing"
description: "How to add and remove Z-Wave devices."
date: 2016-02-27 19:59
sidebar: true
comments: false
sharing: true
footer: true
---

To add (include) a Z-Wave [device](/docs/z-wave/devices/) to your system, go to the [Z-Wave control panel](/docs/z-wave/control-panel/) in the Home Assistant frontend and click the **Add Node** button in the *Z-Wave Network Management* card. This will place the controller in inclusion mode, after which you should activate your device to be included by following the instructions provided with the device.

<p class='warning'>
Don't use the OpenZWave control panel (OZWCP), or the physical button on a controller, to add or remove devices. Many devices will only send the information about their capabilities at the time you include them. If you use the OpenZWave control panel, or the button on a device, then Home Assistant won't have that information. Using the physical button on a controller will also result in a non-security inclusion being performed, which may limit the features the device supports.
</p>

When you add a device, it may initially appear without a specific entity ID (eg `zwave.__`) and without other identifying information. Running a *Heal* should help speed this process up, and you'll need to run a *Heal* anyway so that all the devices in your Z-Wave network learn about the new device. You *might* need to restart Home Assistant (not reboot the system) to have the entity ID fully visible.

## {% linkable_title Adding Security Devices %}

Security Z-Wave devices require a network key before being added to the network using the Add Secure Node button in the Z-Wave Network Management card. You must set the *network_key* configuration variable to use a network key before adding these devices. Some devices only expose their full capabilities when included this way, you should always read the manual for your device to find out the recommended inclusion method.

An easy script to generate a random key:
```bash
cat /dev/urandom | tr -dc '0-9A-F' | fold -w 32 | head -n 1 | sed -e 's/\(..\)/0x\1, /g' -e 's/, $//'
```

<p class='warning'>
Ensure you keep a backup of this key. If you have to rebuild your system and don't have a backup of this key, you won't be able to reconnect to any security devices. This may mean you have to do a factory reset on those devices, and your controller, before rebuilding your Z-Wave network.
</p>

## {% linkable_title Removing Devices %}

To remove (exclude) a Z-Wave device from your system, go to the Z-Wave control panel in the Home Assistant frontend and click the **Remove Node** button in the *Z-Wave Network Management* card. This will place the controller in exclusion mode, after which you should activate your device to be excluded by following the instructions provided with the device.

