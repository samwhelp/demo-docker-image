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
#REF_PLAN_DIR_PATH="$(realpath "${REF_BASE_DIR_PATH}/..")"




##
## ## Master
##

REF_MASTER_BOX_DISTRO_NAME="ubuntu:25.10"
#REF_MASTER_BOX_DISTRO_NAME="ubuntu:latest"



##
## ## Main
##

mkdir -p ./port

## work for debootstrap in docker (--privileged)
podman run -it --rm --privileged -v "${REF_PLAN_DIR_PATH}/port:/port" -v "${REF_PLAN_DIR_PATH}:/opt/prj" "${REF_MASTER_BOX_DISTRO_NAME}" /opt/prj/src/build.sh
