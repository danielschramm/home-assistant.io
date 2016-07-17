---
layout: page
title: "Telegram"
description: "Instructions how to add Telegram notifications to Home Assistant."
date: 2015-10-09 18:00
sidebar: true
comments: false
sharing: true
footer: true
logo: telegram.png
ha_category: Notifications
ha_release: 0.7.5
---


The `telegram` platform uses [Telegram](https://web.telegram.org) to delivery notifications from Home Assistant to your Android device, your Windows phone, or your iOS device.

The requirements are:

- You need a [Telegram bot](https://core.telegram.org/bots). Please follow those [instructions](https://core.telegram.org/bots#botfather) to create one and get the token for your bot. Keep in mind that bots are not allowed to contact users. You need to make the first contact with your user. Meaning that you need to send a message to the bot from your user.
- The `chat_id` of an user.

An easy way to get your chat ID is described below:

```python
import telegram
bot = telegram.Bot(token='YOUR_API_TOKEN')
chat_id = bot.getUpdates()[-1].message.chat_id
print(chat_id)
```

Another way to retrieve your `chat_id` is visiting [https://api.telegram.org/botYOUR_API_TOKEN/getUpdates](https://api.telegram.org/botYOUR_API_TOKEN/getUpdates).

The result set will include your chat ID as `id` in the `from` section:

```json
{
   "ok":true,
   "result":[
      {
         "update_id":254199982,
         "message":{
            "message_id":201,
            "from":{
               "id":123456789,
               "first_name":"Your first name",
...
```

To enable Telegram notifications in your installation, add the following to your `configuration.yaml` file:

```yaml
# Example configuration.yaml entry
notify:
  name: NOTIFIER_NAME
  platform: telegram
  api_key: ABCDEFGHJKLMNOPQRSTUVXYZ
  chat_id: YOUR_CHAT_ID
```

Configuration variables:

- **name** (*Optional*): Setting the optional parameter `name` allows multiple notifiers to be created. The default value is `notify`. The notifier will bind to the service `notify.NOTIFIER_NAME`.
- **api_key** (*Required*): The API token of your bot.
- **chat_id** (*Required*: The chat ID of your user.

To use notifications, please see the [getting started with automation page](/getting-started/automation/).

### {% linkable_title Photo support %}

```yaml
action:
  service: notify.NOTIFIER_NAME
  data:
    title: test notify
    message: That's a exemple
    data:
      photo:
        - url: http://192.168.1.28/camera.jpg
          username: admin
          password: secrete
        - file: /tmp/picture.jpg
          caption: Picture Title xy
        - url: http://somebla.ie/video.png
          caption: I.e. for a Title
```

- **url** or **file** (*Required*): For local or remote path to an image.
- **caption** (*Optional*): The title of the image.
- **username** (*Optional*): Username for an URL which require HTTP basic authentication.
- **password** (*Optional*): Username for an URL which require HTTP basic authentication.

