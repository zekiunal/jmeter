#!/bin/bash
set -e
freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))

rm -fr /tests
mkdir -p /tests

aws s3 cp s3://${AWS_BUCKET} /tests --recursive

export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"

$JMETER_BIN/jmeter \
    -n \
    -D "java.rmi.server.hostname=${IP}" \
    -D "client.rmi.localport=${RMI_PORT}" \
    -t "/tests/${TEST_DIR}/${TEST_PLAN}.jmx" \
    -l "/tests/${TEST_DIR}/${TEST_PLAN}.jtl" \
    -R $REMOTE_HOSTS

exec tail -f jmeter.log