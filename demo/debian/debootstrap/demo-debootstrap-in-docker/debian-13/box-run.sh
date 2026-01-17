#!/usr/bin/env bash




## not work for debootstrap
#podman run -it --rm --name debian-iso-factory-13 debian-iso-factory-13


## work for debootstrap in docker (--privileged)
#podman run -it --rm --replace --privileged --name debian-iso-factory-13-run debian-iso-factory-13




##
## ## create port dir
##

mkdir -p ./port

## work for debootstrap in docker (--privileged)
#podman run -it -v ./port:/port --rm --replace --privileged --name debian-iso-factory-13-run debian-iso-factory-13
podman run -it -v ./port:/port --replace --privileged --name debian-iso-factory-13-run debian-iso-factory-13
