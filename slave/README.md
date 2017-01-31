docker service rm jmeter-worker

docker rm -f jmeter-worker
docker service create --with-registry-auth --name jmeter-worker \
--network jmeter-network  \
--replicas 1 \
-p 1099:1099 \
-e IP=54.93.34.65 \
-e DOMAINS="52.59.225.247 orm.monapi.com" \
--constraint 'node.role == manager' \
registry.monapi.com:5000/monapi/jmeter:server

exec jmeter-server \
    -D "java.rmi.server.hostname=${IP}" \
    -D "client.rmi.localport=${RMI_PORT}" \
    -D "server.rmi.localport=${RMI_PORT}"