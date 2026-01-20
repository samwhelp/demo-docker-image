#!/usr/bin/env bash




##
## ## import archive to docker image
##

mkdir -p ./port


podman import --change "CMD /bin/bash" ./port/rootfs.tar.gz mywork/myubuntu:latest
