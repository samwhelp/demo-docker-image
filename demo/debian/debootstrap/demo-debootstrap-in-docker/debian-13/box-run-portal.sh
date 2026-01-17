#!/usr/bin/env bash




## work for debootstrap in docker (--privileged)
#podman run -it --rm --replace --privileged --name debian-iso-factory-13-run debian-iso-factory-13 /opt/src/build.sh




##
## ## create port dir
##

mkdir -p ./port

## work for debootstrap in docker (--privileged)
#podman run -it  -v ./port:/port --rm --replace --privileged --name debian-iso-factory-13-run debian-iso-factory-13 /opt/src/build.sh
podman run -it  -v ./port:/port --replace --privileged --name debian-iso-factory-13-run debian-iso-factory-13 /opt/src/build.sh
