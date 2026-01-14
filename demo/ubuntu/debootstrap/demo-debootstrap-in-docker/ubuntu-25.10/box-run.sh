#!/usr/bin/env bash




## not work for debootstrap
#podman run -it --rm --name ubuntu-iso-factory-25.10 ubuntu-iso-factory-25.10


## work for debootstrap in docker (--privileged)
podman run -it --rm --replace --privileged --name ubuntu-iso-factory-25.10 ubuntu-iso-factory-25.10
