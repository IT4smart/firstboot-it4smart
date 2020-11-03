#!/bin/bash
for i in $(seq 1 100)
do
	sleep 0.1
	echo $i
done | dialog --title "Provisioning Thin-client" --gauge "The client will reboot automatically, after provisioning is finished." 10 75