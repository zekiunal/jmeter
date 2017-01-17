FROM alpine:3.2

MAINTAINER Zeki Unal <zekiunal@gmail.com>

ENV JMETER_VERSION 3.1
ENV JMETER_HOME /usr/local/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN $JMETER_HOME/bin

ENV IP 127.0.0.1
ENV RMI_PORT 1099

RUN apk --update add openjdk7-jre tar unzip bash && rm -rf /var/cache/apk/*
RUN wget http://mirror.idealhosting.net.tr/Apache//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
RUN tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local/

ENV PATH $PATH:$JMETER_BIN

WORKDIR $JMETER_HOME
EXPOSE $RMI_PORT
COPY start.sh /
ENTRYPOINT ["/start.sh"]