#!/bin/bash

#************************************************************#
#** Autor: Johannes Hubig <johannes.hubig@gmail.com>       **#
#************************************************************#

# The following script should work from FritzOS 6.0 on-
# wards.
#
# Protokoll TR-064 is used to get data from the Fritz!Box.
# Additional info and documentation can be found here:

# http://fritz.box:49000/tr64desc.xml
# https://wiki.fhem.de/wiki/FRITZBOX#TR-064
# https://avm.de/service/schnittstellen/

#******************************************************#
#*********************** CONFIG ***********************#
#******************************************************#

# Fritz!Box Config
[[ -z "$BoxIP" ]] && BoxIP="fritz.box"
[[ -z "$BoxUSER" ]] && BoxUSER="YourUser"
[[ -z "$BoxPW" ]] && BoxPW="YourPW"

#******************************************************#
#*********************** SCRIPT ***********************#
#******************************************************#

### ----------------------------------------------------------------------------------------------------- ###
### ---------------------------- Get 2.4 Ghz Wifi state and connected devices---------------------------- ###
### ----------------------------------------------------------------------------------------------------- ###

location="/upnp/control/wlanconfig1"
uri="urn:dslforum-org:service:WLANConfiguration:1"
action='GetInfo'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>")

SSID=$(echo "$curlOutput1" | grep NewSSID | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
state=$(echo "$curlOutput1" | grep NewEnable | awk -F">" '{print $2}' | awk -F"<" '{print $1}')

location="/upnp/control/wlanconfig1"
uri="urn:dslforum-org:service:WLANConfiguration:1"
action='GetTotalAssociations'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>")

connectedDevices=$(echo "$curlOutput1" | grep NewTotalAssociations | awk -F">" '{print $2}' | awk -F"<" '{print $1}')

echo "2,4G;$SSID;$state;$connectedDevices"

### ----------------------------------------------------------------------------------------------------- ###
### ----------------------------- Get 5 Ghz Wifi state and connected devices ---------------------------- ###
### ----------------------------------------------------------------------------------------------------- ###

location="/upnp/control/wlanconfig2"
uri="urn:dslforum-org:service:WLANConfiguration:2"
action='GetInfo'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>")

SSID=$(echo "$curlOutput1" | grep NewSSID | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
state=$(echo "$curlOutput1" | grep NewEnable | awk -F">" '{print $2}' | awk -F"<" '{print $1}')

location="/upnp/control/wlanconfig2"
uri="urn:dslforum-org:service:WLANConfiguration:2"
action='GetTotalAssociations'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>")

connectedDevices=$(echo "$curlOutput1" | grep NewTotalAssociations | awk -F">" '{print $2}' | awk -F"<" '{print $1}')

echo "5G;$SSID;$state;$connectedDevices"

### ----------------------------------------------------------------------------------------------------- ###
### ----------------------------- Get Guest Wifi state and connected devices ---------------------------- ###
### ----------------------------------------------------------------------------------------------------- ###

location="/upnp/control/wlanconfig3"
uri="urn:dslforum-org:service:WLANConfiguration:3"
action='GetInfo'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>")

SSID=$(echo "$curlOutput1" | grep NewSSID | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
state=$(echo "$curlOutput1" | grep NewEnable | awk -F">" '{print $2}' | awk -F"<" '{print $1}')

location="/upnp/control/wlanconfig3"
uri="urn:dslforum-org:service:WLANConfiguration:3"
action='GetTotalAssociations'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>")

connectedDevices=$(echo "$curlOutput1" | grep NewTotalAssociations | awk -F">" '{print $2}' | awk -F"<" '{print $1}')

echo "Guest;$SSID;$state;$connectedDevices"

### ----------------------------------------------------------------------------------------------------- ###
### ------------------------------------- Get External IP Address --------------------------------------- ###
### ----------------------------------------------------------------------------------------------------- ###

location="/upnp/control/wanipconnection1"
uri="urn:dslforum-org:service:WANIPConnection:1"
action='GetInfo'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>" | grep NewExternalIPAddress | awk -F">" '{print $2}' | awk -F"<" '{print $1}'"")
echo "$curlOutput1"

### ----------------------------------------------------------------------------------------------------- ###
### --------------------------- Get model name and uptime of your Fritz!Box ----------------------------- ###
### ----------------------------------------------------------------------------------------------------- ###

location="/upnp/control/deviceinfo"
uri="urn:dslforum-org:service:DeviceInfo:1"
action='GetInfo'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>")

newModelName=$(echo "$curlOutput1" | grep NewModelName | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
echo "$newModelName"

NewSoftwareVersion=$(echo "$curlOutput1" | grep NewSoftwareVersion | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
echo "$NewSoftwareVersion"

newUpTime=$(echo "$curlOutput1" | grep NewUpTime | awk -F">" '{print $2}' | awk -F"<" '{print $1}' | awk '{printf("%d:%02d:%02d:%02d\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}')
echo "$newUpTime"

### ----------------------------------------------------------------------------------------------------- ###
### -------- Get state of answering machine and number of calls (total and new) of your Fritz!Box ------- ###
### ----------------------------------------------------------------------------------------------------- ###

location="/upnp/control/x_tam"
uri="urn:dslforum-org:service:X_AVM-DE_TAM:1"
action='GetInfo'
option2=0

nameTAM=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'><NewIndex>$option2</NewIndex></u:$action></s:Body></s:Envelope>" | grep "<NewName" | awk -F"</" '{print $1}' |sed -En "s/<(.*)>(.*)/\1 \2/p")
echo "$nameTAM"
stateTAM=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'><NewIndex>$option2</NewIndex></u:$action></s:Body></s:Envelope>" | grep "<NewEnable" | awk -F"</" '{print $1}' |sed -En "s/<(.*)>(.*)/\1 \2/p")
echo "$stateTAM"


location="/upnp/control/x_tam"
uri="urn:dslforum-org:service:X_AVM-DE_TAM:1"
action='GetMessageList'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'><NewIndex>0</NewIndex></u:$action></s:Body></s:Envelope>" | grep "<New" | awk -F"</" '{print $1}' |sed -En "s/<(.*)>(.*)/\1 \2/p" | awk -F"NewURL " '{print $2}')

WGETresult=$(curl $curlOutput1 2>/dev/null)
nbofcallsTotal=$(echo "$WGETresult" | grep "tam calls" | awk -F"-- " '{print $2}' | awk -F"--" '{print $1}')
nbofcallsNew=$(echo "$WGETresult" | grep -c "<New>1</New>")
echo "$nbofcallsNew"
echo "$nbofcallsTotal"

### ----------------------------------------------------------------------------------------------------- ###
### ---------------------------- Get SID and then the internet provider name ---------------------------- ###
### ----------------------------------------------------------------------------------------------------- ###

location="/upnp/control/deviceconfig"
uri="urn:dslforum-org:service:DeviceConfig:1"
action='X_AVM-DE_CreateUrlSID'

SID=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>" | grep "NewX_AVM-DE_UrlSID" | awk -F">" '{print $2}' | awk -F"<" '{print $1}')

providerName=$(curl -s "http://fritz.box/internet/inetstat_monitor.lua?$SID" | grep ipv4_info | awk -F"/span>" '{print $2}' | awk -F">" '{print $2}' | sed 's/<//g' 2>/dev/null)
echo "$providerName"

### ----------------------------------------------------------------------------------------------------- ###
### ---------------------------- Check if update for Fritz!Box is available ----------------------------- ###
### ----------------------------------------------------------------------------------------------------- ###

location="/upnp/control/userif"
uri="urn:dslforum-org:service:UserInterface:1"
action='GetInfo'

curlOutput1=$(curl -s -k -m 5 --anyauth -u "$BoxUSER:$BoxPW" "http://$BoxIP:49000$location" -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>")

updateAvailable=$(echo "$curlOutput1" | grep NewUpgradeAvailable | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
echo "$updateAvailable"
