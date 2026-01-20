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
## ## Clean
##

#rm -rf ./port
#rm -rf ./build




##
## ## Notice
##

## not work for debootstrap
#podman run -it --rm --name ubuntu-iso-factory-25.10 ubuntu-iso-factory-25.10


## work for debootstrap in docker (--privileged)
#podman run -it --rm --replace --privileged --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10




##
## ## Main
##

mkdir -p ./port

## work for debootstrap in docker (--privileged)
#podman run -it --rm --replace --privileged -v ./port:/port --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10
podman run -it --replace --privileged -v "${REF_PLAN_DIR_PATH}/port:/port" -v "${REF_PLAN_DIR_PATH}:/opt/prj" -w "/opt/prj" --name ubuntu-iso-factory-25.10-run ubuntu-iso-factory-25.10
