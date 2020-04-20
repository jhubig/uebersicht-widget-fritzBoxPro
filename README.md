[![GitHub release](https://img.shields.io/github/release/jhubig/uebersicht-widget-fritzBoxPro/all.svg?maxAge=1)](https://GitHub.com/jhubig/uebersicht-widget-fritzBoxPro/releases/)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![GitHub license](https://img.shields.io/github/license/jhubig/uebersicht-widget-fritzBoxPro.svg)](https://github.com/jhubig/uebersicht-widget-fritzBoxPro/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/jhubig/uebersicht-widget-fritzBoxPro.svg)](https://GitHub.com/jhubig/uebersicht-widget-fritzBoxPro/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/jhubig/uebersicht-widget-fritzBoxPro.svg)](https://GitHub.com/jhubig/uebersicht-widget-fritzBoxPro/issues?q=is%3Aissue+is%3Aclosed)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/jhubig/uebersicht-widget-fritzBoxPro/issues)
[![GitHub contributors](https://img.shields.io/github/contributors/jhubig/uebersicht-widget-fritzBoxPro.svg)](https://GitHub.com/jhubig/uebersicht-widget-fritzBoxPro/graphs/contributors/)
[![Github All Releases](https://img.shields.io/github/watchers/jhubig/uebersicht-widget-fritzBoxPro?style=social)](https://github.com/jhubig/uebersicht-widget-fritzBoxPro/watchers)

# fritzBoxPro widget
Widget for Übersicht `http://tracesof.net/uebersicht/` to display data of your Fritz!Box

![banner.png](img/banner.png?raw=true "fritzBoxPro widget")

---

## Features

Currently the following data is collected from your FritzBox

- Firmware version
- Provider name
- Uptime
- External IP Address
- Info about 2.4 Ghz WiFi
- Info about 5 Ghz WiFi
- Info about Guest WiFi
- Answering machine name
- New and total number of calls

There is a notification indication for new firmware update and new calls on answering machine.

![NewUpdateAvailable.gif](img/NewUpdateAvailable.gif?raw=true "New Update Notification")

**Becoma a part of it**   
Do you have any ideas to improve or extend the existing functionality? Feel free to raise an issue or create a pull request. Thanks.


## Setup

### 1. fritzBoxShell.sh file for config

First of all you need to enter your username and hostname of your Fritz!Box in the fritzBoxShell.sh file:

```shell
# Fritz!Box Config
[[ -z "$BoxIP" ]] && BoxIP="fritz.box"
[[ -z "$BoxUSER" ]] && BoxUSER="YourUser"
[[ -z "$BoxPW" ]] && BoxPW="YourPW"
```

Afterwards you need to make the file executable:
Open a terminal and go to the widget folder (usually located under /Users/<yourUser/Library/Application Support/Übersicht/widgets/fritzBoxPro.widget/). Then apply the following:

```shell
chmod 755 fritzBoxShell.sh
```

### 2. Activate the TR064 interface and create a user on your Fritz!Box

To be able to use the the TR-064 interface, it has to be activated on the Fritz!Box:

![FritzBox_Activation_TR064.png](https://github.com/jhubig/uebersicht-widget-fritzBoxPro/blob/master/img/FritzBox_Activation_TR064.png?raw=true "FritzBox_Activation_TR064.png")

In addition, a user needs to be available or created. This user needs to have access to Fritz!Box settings:

![FritzBox_CreateUser_TR064.png](https://github.com/jhubig/uebersicht-widget-fritzBoxPro/blob/master/img/FritzBox_CreateUser_TR064.png?raw=true "FritzBox_CreateUser_TR064.png")

### 3. Start the engines

If steps 1 and 2 were successful, then you should see already data of your Fritz!Box on your widget on the desktop. Enjoy :)
Now you can change the position of the widget in the index.coffee file:

```shell
# Position of the widget on your screen\
pos_top		= '180px'\
pos_left	= '330px'
```
----

## Credits

Design is based on the great "Calender Plan - Task Events App" (https://dribbble.com/shots/4594817-Calendar-Plan-Tasks-Events-App-Freebies). Go check out Brice Séraphin's other work: https://dribbble.com/briceseraphin


----

## Version History
- `1.0` - Initial Release (TBC)

----

AVM, FRITZ!, Fritz!Box and the FRITZ! logo are registered trademarks of AVM GmbH - https://avm.de/

© 2020 | Johannes Hubig
