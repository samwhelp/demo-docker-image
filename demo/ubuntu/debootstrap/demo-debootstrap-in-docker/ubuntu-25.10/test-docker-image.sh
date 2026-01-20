#!/usr/bin/env bash




##
## ## run new image
##

#podman run -it --rm --replace --name test 'mywork/myubuntu'
#podman run -it --rm --name test 'mywork/myubuntu'
podman run -it --replace --name test 'mywork/myubuntu'
