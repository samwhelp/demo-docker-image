#!/usr/bin/env bash




##
## ## Init
##

REF_CMD_FILE_NAME="$(basename "${0}")"
REF_BASE_DIR_PATH="$(dirname "$(realpath "${0}")")"




##
## ## Path / Base
##

REF_PLAN_DIR_PATH="${REF_BASE_DIR_PATH}"
REF_PORT_DIR_PATH="${REF_PLAN_DIR_PATH}/port"
REF_BUILD_DIR_PATH="${REF_PLAN_DIR_PATH}/build"




##
## ## Main
##

mkdir -p "${REF_PORT_DIR_PATH}"

## work for debootstrap in docker (--privileged)
#podman run -it --rm --replace --privileged -v "${REF_PORT_DIR_PATH}:/port" -v "${REF_PLAN_DIR_PATH}/src:/opt/prj/src" -w "/opt/prj/src" --name "debian-iso-factory-13-run" "debian-iso-factory-13"
podman run -it --replace --privileged -v "${REF_PORT_DIR_PATH}:/port" -v "${REF_PLAN_DIR_PATH}/src:/opt/prj/src" -w "/opt/prj/src" --name "debian-iso-factory-13-run" "debian-iso-factory-13"








##
## ## Note
##

## not work for debootstrap
#podman run -it --rm --name debian-iso-factory-13 debian-iso-factory-13


## work for debootstrap in docker (--privileged)
#podman run -it --rm --replace --privileged --name debian-iso-factory-13-run debian-iso-factory-13
