#!/bin/bash
#
# A simple bash script that can be used as a cron to null route brute force attacks
# against your wordpress login page
# 
# Eric L. Santelices <github @digitalroadies>
# Version 1.0 : 2/21/2015
#
MY_IP=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`
MY_LOG_PATH='/var/log/apache2'
MY_ACCESS_LOG_FILE='access.log'
#
#
IP_LIST=`grep wp-login.php $MY_LOG_PATH/$MY_ACCESS_LOG_FILE | cut -d- -f1 - | awk '!a[$0]++' `

for i in ${IP_LIST[@]};
do
        if [ $i != '$MY_IP' ]; then
			EXIST=`ip route show $i | wc -l`
			if [ $EXIST -eq 0 ]
			then
				route add -host $i dev lo
				logger Adding Null Route for $i
			fi
        fi
done