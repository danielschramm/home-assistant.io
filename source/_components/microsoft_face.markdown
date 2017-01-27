---
layout: page
title: "Microsoft Face"
description: "Instructions how to integrate Microsoft Face component into Home Assistant."
date: 2017-01-25 00:00
sidebar: true
comments: false
sharing: true
footer: true
logo: microsoft.png
ha_category: Hub
ha_release: "0.37"
---

The `microsoft_face` component platform is the main component for Microsoft Azure Cognitive service [Face](https://www.microsoft.com/cognitive-services/en-us/face-api). All data are in a own private instance in the azure cloud.

You need an API key which is free but requires a [Azure registration](https://azure.microsoft.com/de-de/free/) with your microsoft ID. The free resource (*F0*) is limit to 30K request in a month and 20 per minute. If you don't want use a azure cloud, you can also get a API key with registration on [cognitive-services](https://www.microsoft.com/cognitive-services/en-us/subscriptions) but they need to recreate all 90 days.

To enable the Microsoft Face component, add the following lines to your `configuration.yaml`:

```yaml
# Example configuration.yaml entry
microsoft_face:
  api_key: YOUR_API_KEY
```

Configuration variables:

- **api_key** (*Required*): The API key for your Cognitive resource.
- **timeout** (*Optional)*: Set timeout for api connection (default 10sec).

### {% linkable_title Person and Groups %}

For most of service you need set a group or a person. So it process and detect only stuff they will given with this group. Home-Assistent create for all group a entity and allow your to show the state, person and IDs inside UI.

For manage this feature you have following services they can call with UI, script or rest api.

- *microsoft_face.create_group*
- *microsoft_face.delete_group*
```yaml
service: microsoft_face.create_group
data:
  name: 'Family'
```

- *microsoft_face.create_person*
- *microsoft_face.delete_person*
```yaml
service: microsoft_face.create_person
data:
  group: family
  name: 'Hans Maier'
```

We need add image to a person. We can add multiple image for every person to make the detection better. We can take a picture from a camera or send a local image to our azure resource.

- *microsoft_face.face_person*
```yaml
service: microsoft_face.face_person
data:
  group: family
  name: 'Hans Maier'
  camera_entity: camera.door
```

For the local image we need *curl*. The personId is present in group entity as attribute.

```bash
curl -v -X POST "https://westus.api.cognitive.microsoft.com/face/v1.0/persongroups/{GroupName}/persons/{personId}/persistedFaces" -H "Ocp-Apim-Subscription-Key: {ApiKey}" -H "Content-Type: application/octet-stream" --data "@/tmp/image.jpg"
```

After we done with changes on a group, we need train this group to make our AI fit to handle the new data.

- *microsoft_face.train_group*
```yaml
service: microsoft_face.train_group
data:
  group: family
