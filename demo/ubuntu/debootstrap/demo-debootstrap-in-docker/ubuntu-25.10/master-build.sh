#!/usr/bin/env bash




## work for debootstrap in docker (--privileged)
#podman run -it --rm --replace --privileged --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10 /opt/src/build.sh




##
## ## create port dir
##

mkdir -p ./port

## work for debootstrap in docker (--privileged)
#podman run -it  -v ./port:/port --rm --replace --privileged --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10 /opt/src/build.sh
podman run -it  -v ./port:/port --replace --privileged --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10 /opt/src/build.sh
