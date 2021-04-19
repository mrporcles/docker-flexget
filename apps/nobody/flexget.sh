#!/bin/bash

echo "$(date "+%d.%m.%Y %T") : Starting DAEMON"
flexget -c /config/config.yml web passwd $WEB_PASSWD
flexget -c /config/config.yml daemon start
