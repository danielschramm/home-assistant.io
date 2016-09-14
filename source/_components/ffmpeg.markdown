---
layout: page
title: "FFmpeg"
description: "Instructions for how to integrate FFmpeg within Home Assistant."
date: 2016-09-14 00:00
sidebar: true
comments: false
sharing: true
footer: true
logo: ffmpeg.png
ha_category: Hub
featured: true
---

<p class='note'>
You need a `ffmpeg` binary in your system path. On Debain 8 or Raspbian (Jessie) you can install it from backports. If you want Hardware support on a Raspberry Pi you need to build from source by yourself. Windows binary are avilable on the [FFmpeg](http://www.ffmpeg.org/) website.
</p>

To set it up, add the following information to your `configuration.yaml` file:

```yaml
ffmpeg:
  ffmpeg_bin: /usr/bin/ffmpeg
  run_test: True
```

Configuration variables:

- **ffmpeg_bin** (*Optional*): Default 'ffmpeg'. Set the ffmpeg binary.
- **run_test** (*Optional*): Default True. Check if `input` is usable by ffmpeg.

### {% linkable_title Troubleshooting %}

In most of case, `ffmpeg` autodetect all needed options to read a video/audio stream or file. But it is possible in rare cases that's needed to set a option to help `ffmpeg`. Per default `ffmpeg` use 5 seconds to detect all options or abort.

First check, if your stream playable by `ffmpeg` with (use option `-an` or `-vn` to disable video or audio stream):

```
$ ffmpeg -i INPUT -an -f null -
```

Now you can see what going wrong. Following list could be help to solve your trouble:

- `[rtsp @ ...] UDP timeout, retrying with TCP`: You need to set RTSP transport in the configuration with: `input: -rtsp_transport tcp -i INPUT`
- `[rtsp @ ...] Could not find codec parameters for stream 0 (Video: ..., none): unspecified size`: FFmpeg need more data or time for autodetect. You can set the `analyzeduration` and/or `probesize` option, play with this value. If you know the needed value you can set it  with: `input: -analyzeduration xy -probesize xy -i INPUT`. More information about that can be found on [FFmpeg](https://www.ffmpeg.org/ffmpeg-formats.html#Description).
