all : toolchain

buildroot :
		git clone https://github.com/tvlad1234/buildroot --recurse-submodules --depth 1
		mkdir buildroot/output
		mkdir buildroot/output/target

toolchain : buildroot
		cp -a configs/custom_kernel_config buildroot/kernel_config
		cp -a configs/buildroot_config buildroot/.config
		cp -a configs/busybox_config buildroot/busybox_config
		cp -a configs/rootfsoverlay/* buildroot/output/target/
		make -C buildroot

