#!/bin/bash

if [[ -z "${DOMAINS}" ]]; then
    echo "Not support domain."
else
    echo ${DOMAINS} >> /etc/hosts
fi

set -e
freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))
export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"
JMETER_LOG="jmeter-server.log" && touch $JMETER_LOG && tail -f $JMETER_LOG &
exec jmeter-server \
    -D "java.rmi.server.hostname=${IP}" \
    -D "client.rmi.localport=${RMI_PORT}" \
    -D "server.rmi.localport=${RMI_PORT}"