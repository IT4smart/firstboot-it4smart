#!/bin/sh -e
logger -t "rc.firstboot" "Starting first boot actions"

logger -t "rc.firstboot" "Enable user-notice-it4smart service"
systemctl enable user-notice-it4smart.service

logger -t "rc.firstboot" "Start provisioning"
eth_device="$(ip route show default | awk '/default/ {print $5}')"
mac_address="$(cat /sys/class/net/${eth_device}/address)"
curl -k -s -H "Content-Type: application/json" -X PUT https://${SHERLOCK_HOSTNAME}/api/v1/device/${mac_address}/provisioning

logger -t "rc.firstboot" "First boot actions finished"