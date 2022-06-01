---
title: Antifurto365 iAlarmXR
description: Instructions on how to integrate iAlarmsXR alarms into Home Assistant.
ha_category:
  - Alarm
ha_iot_class: Cloud Polling
ha_config_flow: true
ha_release: 2022.6
ha_domain: ialarm_xr
ha_codeowners:
  - '@bigmoby'
ha_platforms:
  - alarm_control_panel
ha_integration_type: integration
---

The iAlarmXR integration provides connectivity with the [Antifurto365](https://www.antifurtocasa365.it/) iAlarmXR alarm systems.

This platform supports the following services:

- `alarm_control_panel.alarm_arm_away`
- `alarm_control_panel.alarm_arm_home`
- `alarm_control_panel.alarm_disarm`

{% include integrations/config_flow.md %}
