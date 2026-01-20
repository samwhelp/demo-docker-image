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
#podman run -it --rm --replace --privileged -v ./port:/port --name debian-iso-factory-13-run debian-iso-factory-13 /opt/prj/src/build.sh
podman run -it --rm --privileged -v ./port:/port debian-iso-factory-13 /opt/prj/src/build.sh
