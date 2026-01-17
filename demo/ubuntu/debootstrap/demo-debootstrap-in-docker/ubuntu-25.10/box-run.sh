#!/usr/bin/env bash




## not work for debootstrap
#podman run -it --rm --name ubuntu-iso-factory-25.10 ubuntu-iso-factory-25.10


## work for debootstrap in docker (--privileged)
#podman run -it --rm --replace --privileged --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10




##
## ## create port dir
##

mkdir -p ./port

## work for debootstrap in docker (--privileged)
#podman run -it -v ./port:/port --rm --replace --privileged --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10
podman run -it -v ./port:/port --replace --privileged --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10
