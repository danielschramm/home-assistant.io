---
layout: page
title: "HTTP"
description: "Offers a web framework to serve files."
date: 2015-12-06 21:35
sidebar: true
comments: false
sharing: true
footer: true
logo: http.png
ha_category: "Other"
---

The `http` component serves all files and data required for the Home Assistant frontend. You only need to add this to your configuration file if you want to change any of the default settings.

<p class='note warning'>
It's HIGHLY recommended that you set the `api_password`, especially if you are planning to expose your installation to the internet.
</p>

```yaml
# Example configuration.yaml entry
http:
  api_password: YOUR_PASSWORD
```

Configuration variables:

- **api_password** (*Optional*): Protect Home Assistant with a password.
- **server_host** (*Optional*): Only listen to incoming requests on specific ip/host (default: accept all)
- **server_port** (*Optional*): Let you set a port to use. Defaults to 8123.
- **development** (*Optional*): Disable caching and load unvulcanized assets. Useful for Frontend development.
- **ssl_certificate** (*Optional*): Path to your TLS/SSL certificate to serve Home Assistant over a secure connection.
- **ssl_key** (*Optional*): Path to your TLS/SSL key to serve Home Assistant over a secure connection.
- **cors_allowed_origins** (*Optional*): A list of origin domain names to allow [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) requests from. Enabling this will set the `Access-Control-Allow-Origin` header to the Origin header if it is found in the list, and the `Access-Control-Allow-Headers` header to `Origin, Accept, X-Requested-With, Content-type, X-HA-access`. You must provide the exact Origin, i.e. `https://home-assistant.io` will allow requests from `https://home-assistant.io` but __not__ `http://home-assistant.io`.
- **approved_ips** (*Optional*): A list of approved ips. Then it will be possible to login from given ips without providing a password.

The sample below shows a configuration entry with possible values: 

```yaml
# Example configuration.yaml entry
http:
  api_password: YOUR_PASSWORD
  server_port: 12345
  ssl_certificate: /etc/letsencrypt/live/hass.example.com/fullchain.pem
  ssl_key: /etc/letsencrypt/live/hass.example.com/privkey.pem
  cors_allowed_origins:
    - https://google.com
    - https://home-assistant.io
  approved_ips:
    - 127.0.0.1
    - 192.168.1.9
```

The [Set up encryption using Let's Encrypt](/blog/2015/12/13/setup-encryption-using-lets-encrypt/) blog post gives you details about the encryption of your traffic using free certificates from [Let's Encrypt](https://letsencrypt.org/).

On top of the `http` component is a [REST API](/developers/rest_api/) and a [Python API](/developers/python_api/) available. There is also support for [Server-sent events](/developers/server_sent_events/) available.

The `http` platforms are not real platforms within the meaning of the terminology used around Home Assistant. Home Assistant's [REST API](/developers/rest_api/) sends and receives messages over HTTP. 

To use those kind of [sensors](/components/sensor.http/) or [binary sensors](components/binary_sensor.http/) in your installation no configuration in Home Assistant is needed. All configuration is done on the devices themselves. This means that you must be able to edit the target URL or endpoint and the payload. The entity will be created after the first message has arrived.

All [requests](/developers/rest_api/#post-apistatesltentity_id) need to be sent to the endpoint of the device and must be **POST**.

If you want to use Home Assistant to host or serve static files then create a directory called `www` under the `.homeassistant` configuration path. The static files in `.homeassistant/www/` can be accessed by the following URL `http://your.domain:8123/local/`.
