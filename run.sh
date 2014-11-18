#!/bin/sh -x

# Get Loggly file setup script
curl -O https://www.loggly.com/install/configure-linux.sh
curl -O https://www.loggly.com/install/configure-file-monitoring.sh

# Remove checkIfFileLogsMadeToLoggly() function from script
# This takes too long.
sed -i "s/checkIfLogsMadeToLoggly$/echo \"Not checking...\"/g" configure-linux.sh
sed -i "s/checkIfFileLogsMadeToLoggly$//g" configure-file-monitoring.sh
sed -i "s/curl .*//g" configure-file-monitoring.sh

# Configure Syslog Daemon
#sudo bash configure-linux.sh -a apprity -t ${LOGGLY_TOKEN} -u ${USERNAME}

echo ${DIRECTORIES_TO_MONITOR} | sed -n 1'p' | tr ',' '\n' | while read directory_path; do
    echo ${directory_path}

    for file in $( ls ${directory_path} ); do
        if [ -f ${directory_path}/${file} ]; then
            echo item: ${file}
            sudo bash configure-file-monitoring.sh -a ${LOGGLY_ACCOUNT} -t ${LOGGLY_TOKEN} -u ${USERNAME} -p "${PASSWORD}" -f "${directory_path}/${file}" -l ${file} -tag "${TAGS}"
        fi
    done
done


# Kill /usr/sbin/rsyslogd
PID=$(pidof rsyslogd)
kill -9 ${PID}

# start in foreground
/usr/sbin/rsyslogd -n