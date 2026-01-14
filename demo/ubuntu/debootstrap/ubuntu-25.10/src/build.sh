#!/usr/bin/env bash




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

	mkdir -p ../build

	mkdir -p ../build/img

	mkdir -p ../build/iso

	mkdir -p ../build/out

}

mod_build_prepare_package () {

	sudo apt-get update

	sudo apt-get install debootstrap -y

}

mod_build_prepare () {

	mod_build_prepare_dir

	mod_build_prepare_package

}


mod_build_create_base_rootfs () {

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




##
## ## Model / Portal
##

mod_build_main ()  {

	mod_build_prepare

	mod_build_create_base_rootfs

}




##
## ## Main
##

__main__ () {

	mod_build_main

}

__main__
