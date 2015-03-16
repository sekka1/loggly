#!/bin/bash -x

if [ -z ${INTERVAL_TIME} ]; then
	INTERVAL_TIME=86400 # set default to one day
fi


while true; do

	# Run Loggly file monitor setup and start rsyslog
	/opt/run.sh

	# Sleep for duration before restarting
	echo "Sleeping for ${INTERVAL_TIME} seconds..."
	sleep ${INTERVAL_TIME}

	# Kill /usr/sbin/rsyslogd
        PID=$(pidof rsyslogd)
        kill -9 ${PID}

done
