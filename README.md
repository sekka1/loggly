Loggly Container
=================

A container that will send logs to Loggly by passing in a list of directories.  Every files in the
directory will be added into the Syslog entry to be monitored.

This container uses the Loggly scripts to setup Syslog:

    https://apprity.loggly.com/sources/setup/file_monitoring_linux

Using the Container
=======================

You can attached to another container if you exposed a data volume from the target containers.  This is
useful in some scenarios.  For example, if you had a Tomcat or web server container that is outputting
logs.  You add a data volume when starting that container (https://docs.docker.com/userguide/dockervolumes/#adding-a-data-volume).
Then using this container, you can attach to it using the --volumes-from docker flag to give this Loggly
container access to it.

    docker run -d \
    --volumes-from webui \
    --env LOGGLY_TOKEN=<TOKEN> \
    --env LOGGLY_ACCOUNT=<ACCOUNT_NAME> \
    --env USERNAME=<USERNAME> \
    --env PASSWORD=<PASSWORD> \
    --env DIRECTORIES_TO_MONITOR="/opt/tomcat/logs,/var/log" \
    --env TAGS="my-super-files" \
    --env INTERVAL_TIME=3600 \
    cloudrity/loggly

* INTERVAL_TIME - since the Loggly file monitor script is a one time add.  If new files shows up in the directories they are not sent to Loggly.  The interval time will restart the entire process per the time which will add in any new files in the directories that you are monitoring.

Docker container
====================

Docker container URL:

    https://registry.hub.docker.com/u/garland/loggly/

