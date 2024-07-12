all : everything

buildroot :
	git clone https://github.com/tvlad1234/buildroot --recurse-submodules --depth 1

linux_toolchain : buildroot
	cp -a linux_configs/custom_kernel_config buildroot/kernel_config
	cp -a linux_configs/buildroot_config buildroot/.config
	cp -a linux_configs/busybox_config buildroot/busybox_config
	cp -a linux_configs/uclibc_config buildroot/uclibc_config
	cp -a linux_configs/uclibc_config buildroot/uclibc_config_extra
	true || cp -a linux_configs/rootfsoverlay/* buildroot/output/target/
	make -C buildroot
	cp -a linux_configs/rootfsoverlay/* buildroot/output/target/

everything : linux_toolchain
	make -C hello_linux deploy
	make -C coremark deploy
	make -C c4 deploy
	make -C duktape deploy 
	make -C buildroot
