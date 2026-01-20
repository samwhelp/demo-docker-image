#!/usr/bin/env bash




##
## ## Init
##

REF_CMD_FILE_NAME="$(basename "${0}")"
REF_BASE_DIR_PATH="$(dirname "$(realpath "${0}")")"




##
## ## Path / Base
##

REF_PLAN_DIR_PATH="$(realpath "${REF_BASE_DIR_PATH}/..")"
REF_BUILD_DIR_PATH="${REF_PLAN_DIR_PATH}/build"
REF_PORT_DIR_PATH="/port"




##
## ## Path / Distro
##

REF_DISTRO_FILE_NAME="distro"
REF_DISTRO_DIR_PATH="${REF_BUILD_DIR_PATH}/${REF_DISTRO_FILE_NAME}"

REF_DISTRO_IMG_DIR_PATH="${REF_DISTRO_DIR_PATH}/img"
REF_DISTRO_OUT_DIR_PATH="${REF_DISTRO_DIR_PATH}/out"

REF_DISTRO_FOOTFS_FILE_NAME="rootfs.tar.gz"
REF_DISTRO_FOOTFS_FILE_PATH="${REF_DISTRO_OUT_DIR_PATH}"




##
## ## Path / Debootstrap
##

REF_BUILD_ARCH="amd64"
REF_BUILD_PACKAGE_INCLUDE="ca-certificates,openssl,console-setup-linux,console-setup,locales,tzdata"
REF_BUILD_SUITE="questing"
REF_BUILD_PACKAGE_REPO_URL="http://tw.archive.ubuntu.com/ubuntu/"




##
## ## Env
##

echo
echo "export DEBIAN_FRONTEND=noninteractive"
export DEBIAN_FRONTEND=noninteractive
echo




##
## ## Model / Module
##

mod_build_prepare_dir () {

	mkdir -p "${REF_BUILD_DIR_PATH}"

	mkdir -p "${REF_DISTRO_IMG_DIR_PATH}"

	mkdir -p "${REF_DISTRO_OUT_DIR_PATH}"

}

mod_build_prepare_package () {

	sudo apt-get update

	sudo apt-get install debootstrap -y

}

mod_build_prepare () {

	mod_build_prepare_dir

	mod_build_prepare_package

}

mod_build_create_base_rootfs_sample () {

	echo
	echo "run: debootstrap"
	echo

	sudo debootstrap \
		--arch=amd64 \
		--variant=minbase \
		--include=ca-certificates,openssl,console-setup-linux,console-setup,locales,tzdata \
		"questing" \
		../build/img \
		"http://tw.archive.ubuntu.com/ubuntu/"

}

mod_build_create_base_rootfs_raw () {

	echo
	echo "run: debootstrap"
	echo

	sudo debootstrap \
		--arch=${REF_BUILD_ARCH} \
		--variant=minbase \
		--include=${REF_BUILD_PACKAGE_INCLUDE} \
		${REF_BUILD_SUITE} \
		${REF_DISTRO_IMG_DIR_PATH} \
		${REF_BUILD_PACKAGE_REPO_URL}


}


mod_build_create_base_rootfs () {

	echo
	echo "run: debootstrap"
	echo


local run_cmd=$(cat << __EOF__
	debootstrap
		--arch=${REF_BUILD_ARCH}
		--variant=minbase
		--include=${REF_BUILD_PACKAGE_INCLUDE}
		${REF_BUILD_SUITE}
		${REF_DISTRO_IMG_DIR_PATH}
		${REF_BUILD_PACKAGE_REPO_URL}
__EOF__
)


	echo
	echo $run_cmd
	echo
	$run_cmd


}

mod_build_archive_base_rootfs_v001 () {

	echo
	echo "run: archive-rootfs"
	echo

	cd "${REF_DISTRO_IMG_DIR_PATH}"

	#tar --create --auto-compress --file "${REF_DISTRO_FOOTFS_FILE_PATH}" ./*
	tar --create --auto-compress --file "${REF_DISTRO_FOOTFS_FILE_PATH}" .

	cd "${OLDPWD}"

}

mod_build_archive_base_rootfs () {

	echo
	echo "run: archive-rootfs"
	echo

	tar -C "${REF_DISTRO_IMG_DIR_PATH}" -cf "${REF_DISTRO_FOOTFS_FILE_PATH}" .

}

mod_build_cp_rootfs_archive_to_port_dir () {

	echo
	echo "run: copy-to-port"
	echo

	sudo mkdir -p "${REF_PORT_DIR_PATH}"

	if ! [ -f "${REF_DISTRO_FOOTFS_FILE_PATH}" ]; then
		echo
		echo "File Not Exist: ${REF_DISTRO_FOOTFS_FILE_PATH}"
		echo
		return 0
	fi


	cp -f "${REF_DISTRO_FOOTFS_FILE_PATH}" "${REF_PORT_DIR_PATH}/${REF_DISTRO_FOOTFS_FILE_NAME}"


	echo
	echo "tips: please check port dir"
	echo


}




##
## ## Model / Portal
##

mod_build_main ()  {

	mod_build_prepare

	mod_build_create_base_rootfs

	mod_build_archive_base_rootfs

	mod_build_cp_rootfs_archive_to_port_dir

}




##
## ## Main
##

__main__ () {

	mod_build_main

}

__main__
