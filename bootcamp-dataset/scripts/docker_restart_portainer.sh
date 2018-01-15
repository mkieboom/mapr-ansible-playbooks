#! /bin/bash

# re-launch portainer docker


# Kill portainer docker if currently running
docker ps | awk '{ print $1,$2 }' | grep portainer | awk '{print $1 }' | xargs -I {} docker kill {}


# Launch the docker container
docker run -d \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /portainer:/data \
-p 9001:9000 \
portainer/portainer

