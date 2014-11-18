Loggly Container
=================

A container that will send logs to Loggly by passing in a list of directories.  Every files in the
directory will be added into the Syslog entry to be monitored.

This container uses the Loggly scripts to setup Syslog:

    https://apprity.loggly.com/sources/setup/file_monitoring_linux

Running the container
=======================

    docker run -d \
    --env LOGGLY_TOKEN=<TOKEN> \
    --env LOGGLY_ACCOUNT=<ACCOUNT_NAME> \
    --env USERNAME=<USERNAME> \
    --env PASSWORD=<PASSWORD> \
    --env DIRECTORIES_TO_MONITOR="/opt/tomcat/logs,/var/log" \
    --env TAGS="my-super-files" \
    cloudrity/loggly

Docker container
====================

Docker container URL:

    https://registry.hub.docker.com/u/garland/loggly/

    