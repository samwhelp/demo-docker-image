#!/usr/bin/env bash




##
## ## Clean
##

rm -rf ./port




##
## ## Main
##

mkdir -p ./port

## work for debootstrap in docker (--privileged)
#podman run -it  -v ./port:/port --rm --replace --privileged --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10 /opt/src/build.sh
podman run -it  -v ./port:/port --replace --privileged --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10 /opt/src/build.sh
