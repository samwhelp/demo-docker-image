#!/usr/bin/env bash




## work for debootstrap in docker (--privileged)
podman run -it --rm --replace --privileged --name ubuntu-iso-factory-25.10 ubuntu-iso-factory-25.10 /opt/src/build.sh
