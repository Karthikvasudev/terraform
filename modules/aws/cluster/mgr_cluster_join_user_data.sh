#!/bin/sh

# install docker
#curl -fsSL https://test.docker.com/ | sh
curl -fsSLO https://test.docker.com/builds/Linux/x86_64/docker-1.12.0-rc4.tgz && tar --strip-components=1 -xvzf docker-1.12.0-rc4.tgz -C /usr/bin

# Then start docker in daemon mode:
/usr/bin/dockerd &

sleep 7s

# initialize swarm cluster
#docker swarm join --secret ${NODE_REG_SECRET_TOKEN} --manager --listen-addr 0.0.0.0:2377 ${MGR_HOST_IP}:2377
docker swarm join --secret ${NODE_REG_SECRET_TOKEN} --manager ${MGR_HOST_IP}:2377