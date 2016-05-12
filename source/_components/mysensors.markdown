---
layout: page
title: "MySensors"
description: "Instructions how to integrate MySensors sensors into Home Assistant."
date: 2016-04-21 13:30 +0100
sidebar: true
comments: false
sharing: true
footer: true
logo: mysensors.png
ha_category: Hub
featured: true
---

The [MySensors](https://www.mysensors.org) project combines Arduino boards with NRF24L01 radio boards to build sensor networks. The component will automatically add all available devices to Home Assistant, after [presentation](#presentation) is done.

### {% linkable_title Configuration %}

Integrate your Serial or Ethernet MySensors Gateway by adding the following to your `configuration.yaml` file:

```yaml
# Example configuration.yaml entry
mysensors:
  gateways:
    - device: '/dev/ttyUSB0'
      persistence_file: 'path/mysensors.json'
      baud_rate: 38400
    - device: '/dev/ttyACM0'
      persistence_file: 'path/mysensors2.json'
      baud_rate: 115200
    - device: '192.168.1.18'
      persistence_file: 'path/mysensors3.json'
      tcp_port: 5003
  debug: true
  persistence: true
  version: '1.5'
  optimistic: false
```

Configuration variables:

- **device** (*Required*): The path to the serial gateway where it is connected to your Home Assistant host, or the address of the tcp ethernet gateway. Resolving DNS addresses is theoretically supported but not tested.
- **baud_rate** (*Optional*): Specifies the baud rate of the connected serial gateway. Default is 115200.
- **tcp_port** (*Optional*): Specifies the port of the connected tcp ethernet gateway. Default is 5003.
- **debug** (*Optional*): Enable or disable verbose debug logging. Default is false.
- **persistence** (*Optional*): Enable or disable local persistence of sensor information. If this is disabled, then each sensor will need to send presentation messages after Home Assistant starts. Default is true.
- **persistence_file** (*Optional*): The path to a file to save sensor information. The file extension determines the file type. Currently supported file types are 'pickle' and 'json'.
- **version** (*Optional*): Specifies the MySensors protocol version to use. Supports 1.4 and 1.5. Default is 1.4.
- **optimistic** (*Optional*): Enable or disable optimistic mode for actuators (switch/light). Default is false. Set this to true if no state feedback from actuators is possible. Home Assistant will assume that the command succeeded and change state.

If you are using an original Arduino as a serial gateway, the port will be named `ttyACM*`. The exact number can be determined with the command shown below.

```bash
$ ls /dev/ttyACM*
```

### {% linkable_title Presentation %}

Present a MySensors sensor or actuator, by following these steps:

1. Connect the serial gateway to your computer or the ethernet gateway to your network.
2. Configure the MySensors component in configuration.yaml.
3. Start hass.
4. Wait for "Connected to [device]" in the log output.
5. Write and upload your MySensors sketch to the sensor. Make sure you:
    - Either use a manual node id, or AUTO for requesting a node id from the controller, in the begin method for initialization of the MySensors library.
    - Send sketch name.
    - Present the sensor's S_TYPE.
    - Send at least one initial value per V_TYPE.
6. Start the sensor.

Visit the [library api] of MySensors for more information.

[library api]: https://www.mysensors.org/download/sensor_api_15
