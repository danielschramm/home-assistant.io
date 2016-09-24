---
layout: page
title: "Setup Development Environment"
description: "Setup your environment to start developing for Home Assistant."
date: 2014-12-21 13:32
sidebar: true
comments: false
sharing: true
footer: true
---

You will need to set up a development environment if you want to start developing a new feature or component for Home Assistant. Please follow these steps to get setup.
Visit the [the Home Assistant repository](https://github.com/home-assistant/home-assistant) first and click fork in the top right.

We suggest that you setup a virtual environment using [`venv`](https://docs.python.org/3.4/library/venv.html) before running the setup script.

```bash
$ git clone https://github.com/YOUR_GIT_USERNAME/home-assistant.git
$ cd home-assistant
$ git remote add upstream https://github.com/home-assistant/home-assistant.git
$ script/setup
```
On Windows you can use `python setup.py develop` instead of the setup script.

After following these steps, running `hass` will invoke your local installation.

###Developing on Windows 
If you are using Windows as a development platform ensure you have the correct Microsoft Visual C++ build tools installed. Please check [the Windows Compilers](https://wiki.python.org/moin/WindowsCompilers) section on the [Python website](https://www.python.org/) for details. Validation using `tox` will fail if this is not done correctly. 

Ensure you install or upgrade the Setuptools Python package. It contains compatibility improvements and adds automatic use of compilers: 
```bash
pip install --upgrade setuptools
```

