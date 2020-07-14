---
title: "Humidifier Card"
sidebar_label: Humidifier
description: "The Humidifier card gives control of your humidifier entity, allowing you to change the target humidity and mode of the entity."
---

The Humidifier card lets you control and monitor humidifiers, dehumidifiers, and hygrostat devices.

<p class='img'>
  <img src='/images/lovelace/lovelace_humidifier_card.png' alt='Screenshot of the humidifier card'>
  Screenshot of the humidifier card.
</p>

{% configuration %}
type:
  required: true
  description: humidifier
  type: string
entity:
  required: true
  description: Entity id of `humidifier` domain
  type: string
name:
  required: false
  description: Name of Entity
  type: string
  default: Entity Name
theme:
  required: false
  description: Set to any theme within `themes.yaml`
  type: string
{% endconfiguration %}

## Example

```yaml
- type: humidifier
  entity: humidifier.bedroom
  name: Bedroom Humidifier
```
