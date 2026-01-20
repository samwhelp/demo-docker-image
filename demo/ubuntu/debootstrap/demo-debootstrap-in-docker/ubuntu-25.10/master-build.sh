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
#podman run -it --rm --replace --privileged  -v ./port:/port --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10 /opt/prj/src/build.sh
podman run -it --rm --privileged -v ./port:/port ubuntu-iso-factory-25.10 /opt/prj/src/build.sh
