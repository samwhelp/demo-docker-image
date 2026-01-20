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
## ## Master
##

REF_MASTER_BOX_DISTRO_NAME="ubuntu:25.10"
#REF_MASTER_BOX_DISTRO_NAME="ubuntu:latest"




##
## ## Clean
##

rm -rf "${REF_PORT_DIR_PATH}"
rm -rf "${REF_BUILD_DIR_PATH}"




##
## ## Main
##

mkdir -p "${REF_PORT_DIR_PATH}"

## work for debootstrap in docker (--privileged)
#podman run -it --rm --replace --privileged -v "${REF_PORT_DIR_PATH}:/port" -v "${REF_PLAN_DIR_PATH}:/opt/prj" -w "/opt/prj" --name "ubuntu-iso-factory-25.10-run" "ubuntu-iso-factory-25.10" "/opt/prj/src/build.sh"
podman run -it --replace --privileged -v "${REF_PORT_DIR_PATH}:/port" -v "${REF_PLAN_DIR_PATH}:/opt/prj" -w "/opt/prj" --name "ubuntu-iso-factory-25.10-run" "ubuntu-iso-factory-25.10" "/opt/prj/src/build.sh"
