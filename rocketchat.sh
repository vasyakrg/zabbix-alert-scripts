#!/bin/bash

# Rocket.Chat incoming web-hook URL and user name
url="https://rocketchaturl/hooks/$1"
username='zabbix'
icon_emoji=':grinning:'
LOGFILE="zabbix-rocketchat.log"

# View and set the values of this envs in Zabbix settings
STATUS_OK=OK
STATUS_UPDATE=UPDATE
STATUS_PROBLE=PROBLEM

## Values received by this script:
# To = $1 (RocketChat Channel Token )
# Subject = $2 (usually either OK or PROBLEM)
# Message = $3 (whatever message the Zabbix action sends, preferably something like "Zabbix server is unreachable for 5 minutes - Zabbix server (127.0.0.1)")

# Get the Rocketchat zabbix subject ($2 - hopefully either PROBLEM or RECOVERY)
subject="${2^^}"

# Change color and emoji depending on the subject - Green (RECOVERY), Red (PROBLEM), Yellow (UPDATE)
if [[ "$subject" == *"${STATUS_OK}"* ]]; then
        color="#00ff33"
        icon_emoji=':grinning:'
elif [[ "$subject" == *"${STATUS_UPDATE}"* ]]; then
        color="#ffcc00"
        icon_emoji=':warning:'
elif [[ "$subject" == *"${STATUS_PROBLE}"* ]]; then
        color="#ff2a00"
        icon_emoji=':slight_frown:'
fi

# The message that we want to send to Mattermost  is the "subject" value ($2 / $subject - that we got earlier)
#  followed by the message that Zabbix actually sent us ($3)
message="${subject}: $3"

# Build our JSON payload and send it as a POST request to the Mattermost incoming web-hook URL
payload='{"username":"'$username'","emoji":"'$icon_emoji'","attachments":[{"color":"'${color}'","title":"'${subject}'","text":"'${message}'"}]}'

# Send Payload to the Rocket.Chat Server
curl -X POST -H 'Content-Type: application/json' --data "${payload}" $url

# Write errors to log
echo "curl -X POST -H 'Content-Type: application/json' --data "${payload}" $url" 2>>${LOGFILE}
