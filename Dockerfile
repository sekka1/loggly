#
# Docker file: data container holding the Apprity.zip file
#
#

FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y wget curl vim

WORKDIR /opt

ADD ./run.sh /opt/run.sh
RUN chmod 777 run.sh

CMD ["./run.sh"]