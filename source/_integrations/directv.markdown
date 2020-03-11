---
title: DirecTV
description: Instructions on how to integrate DirecTV receivers into Home Assistant.
logo: directv.png
ha_category:
  - Media Player
ha_release: 0.25
ha_iot_class: Local Polling
ha_domain: directv
ha_config_flow: true
---

The DirecTV platform allows you to control a [DirecTV](https://www.directv.com) receiver and its client devices.

### Configuration

Go to the integrations page in your configuration and click on new integration -> DirecTV.
If your DirecTV device is on, it has likely been discovered already and you just have to confirm the detected device.

### YAML Configuration

Manual configuration of your DirecTV device is also possible, add the following to your `configuration.yaml` file:


```yaml
# Example configuration.yaml entry
directv:
  - host: IP_ADDRESS
```

{% configuration %}
host:
  description: "The hostname or IP of the DirecTV receiver, e.g., `192.168.0.10`."
  required: true
  type: string
{% endconfiguration %}

## Services

### Media control services

Available services: turn_on, turn_off, media_play, media_pause, media_stop, media_next_track, media_previous_track, play_media

#### Service `media_player.play_media`

| Service data attribute | Optional | Description                                                                                                                                                            |
| -----------------------| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity_id`            |      yes | Target a specific media player. Defaults to all.                                                                                                                       |
| `media_content_id`     |       no | The channel number to change to.                   |
| `media_content_type`   |       no | A media type. Has to be `channel`.
