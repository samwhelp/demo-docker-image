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

mod_build_archive_base_rootfs_v001 () {

	echo
	echo "run: archive-rootfs"
	echo

	cd ../build/img

	#tar --create --auto-compress --file ../out/rootfs.tar.gz ./*
	tar --create --auto-compress --file ../out/rootfs.tar.gz .

	cd "${OLDPWD}"

}

mod_build_archive_base_rootfs () {

	echo
	echo "run: archive-rootfs"
	echo

	tar -C ../build/img -cf build/out/rootfs.tar.gz .

}

mod_build_cp_rootfs_archive_to_port_dir () {

	echo
	echo "run: copy-to-port"
	echo

	sudo mkdir -p /port

	if ! [ -f ../build/out/rootfs.tar.gz ]; then
		echo
		echo "File Not Exist: ../build/out/rootfs.tar.gz"
		echo
		return 0
	fi

	cp -rfT ../build/out/rootfs.tar.gz /port/rootfs.tar.gz


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
