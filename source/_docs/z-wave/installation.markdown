---
layout: page
title: "Z-Wave"
description: "Installation of the Z-Wave component."
date: 2017-09-21 10:00
sidebar: true
comments: false
sharing: true
footer: true
redirect_from: /getting-started/z-wave-installation/
---

As of version 0.45, Home Assistant automatically installs python-openzwave from PyPI as needed. This also introduced the integrated Z-Wave control panel, removing the need for the OpenZWave control panel.

There is one dependency you will need to have installed ahead of time (included in `systemd-devel` on Fedora/RHEL systems):

```bash
$ sudo apt-get install libudev-dev
```

<p class='note'>
The installation of python-openzwave can take half an hour or more on a Raspbery Pi.
</p>

## {% linkable_title Configuration %}

```yaml
# Example configuration.yaml entry
zwave:
  usb_path: /dev/ttyUSB0
```

{% configuration zwave %}
usb_path: 
  description: The port where your device is connected to your Home Assistant host.
  required: false
  type: string
  default: /zwaveusbstick
network_key:
  description: The 16-byte network key in the form `"0x01, 0x02..."` used in order to connect securely to compatible devices.
  required: false
  type: string
  default: None
config_path: 
  description: The path to the Python OpenZWave configuration files.
  required: false
  type: string
  default: the 'config' that is installed by python-openzwave
autoheal:
  description: Allows disabling auto Z-Wave heal at midnight.
  required: false
  type: boolean
  default: True
polling_interval:
  description: The time period in milliseconds between polls of a nodes value. Be careful about using polling values below 30000 (30 seconds) as polling can flood the zwave network and cause problems.
  required: false
  type: integer
  default: 60000
debug:
  description: Print verbose z-wave info to log.
  required: false
  type: boolean
  default: False
new_entity_ids:
  description: Switch to new entity_id generation.
  required: false
  type: boolean
  default: True
device_config: 
  description: This attribute contains node-specific override values. (For releases prior to 0.39 this variable is called **customize**) See [Customizing devices and services](/docs/configuration/customizing-devices/) for the format.
  required: false
  type: string, list
  keys: 
    ignored:
      description: Ignore this entity completely. It won't be shown in the Web Interface and no events are generated for it.
      required: false
      type: boolean
      default: False
    polling_intensity:
      description: Enables polling of a value and sets the frequency of polling (0=none, 1=every time through the list, 2=every other time, etc). If not specified then your device will not be polled.
      required: false
      type: integer
      default: 0
    refresh_value:
      description: Enable refreshing of the node value. Only the light component uses this.
      required: false
      type: boolean
      default: False
    delay:
      description: Specify the delay for refreshing of node value. Only the light component uses this.
      required: false
      type: integer
      default: 2
    invert_openclose_buttons:
      description: Inverts function of the open and close buttons for the cover domain.
      required: false
      type: boolean
      default: False
{% endconfiguration %}

### {% linkable_title Finding the controller path on Linux %}

To find the path of your Z-Wave USB stick or module, connect it to your system and run:

```bash
$ ls -ltr /dev/tty*|tail -n 1
```

That will give you a line that looks something like this:

```bash
crw-rw---- 1 root dialout 204, 64 Sep 21 10:25 /dev/ttyUSB0
```

Where the date and time displayed is approximately the time you connected the USB stick or module (it may also be something like  `/dev/ttyAMA0` or `/dev/ttyACM0`). The number will be zero for the first device connected, and higher numbers for later devices.

Or, if there is no result, try to find detailed USB connection info with:

```bash
$ dmesg | grep USB
```

If Home Assistant (`hass`) runs with another user (e.g. *homeassistant* on Hassbian) give access to the stick with:

```bash
$ sudo usermod -a -G dialout homeassistant
```

<p class='Note'>
The output from `ls -ltr` above contains the following information
The device type is `c` (character special) and permissions are `rw-rw----`, meaning only the owner and group can read and write to it, there is only `1` link to the file, it is owned by `root` and can be accessed by the group `dialout`, it has a major device number of `204`, and a minor device number of `64`, the device was connected at `10:25` on `21 September`, and the device is `/dev/ttyUSB0`.
</p>

#### {% linkable_title Creating a Persistent Device Path %}

Depending on what's plugged into your USB ports, the name found above may change. You can lock in a name, such as `/dev/zwave`, by following [these instructions](http://hintshop.ludvig.co.nz/show/persistent-names-usb-serial-devices/).

### {% linkable_title Finding the controller path on macOS %}

On macOS you can find the USB stick with:

```bash
$ ls /dev/cu.usbmodem*
```

### {% linkable_title Network Key %}

Security Z-Wave devices require a network key before being added to the network using the Add Secure Node button in the Z-Wave Network Management card. You must set the *network_key* configuration variable to use a network key before adding these devices.

An easy script to generate a random key:
```bash
cat /dev/urandom | tr -dc '0-9A-F' | fold -w 32 | head -n 1 | sed -e 's/\(..\)/0x\1, /g' -e 's/, $//'
```

Ensure you keep a backup of this key. If you have to rebuild your system and don't have a backup of this key, you won't be able to reconnect to any security devices. This may mean you have to do a factory reset on those devices, and your controller, before rebuilding your Z-Wave network.

## {% linkable_title First Run %}

Upon first run, the `zwave` component will take time to initialize entities and entities may appear with incomplete names. Running a network heal may speed up this process.
