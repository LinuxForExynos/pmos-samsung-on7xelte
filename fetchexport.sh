#!/bin/bash
pmos=/home/$(whoami)/.local/var/pmbootstrap/
cp -rv $pmos/chroot_rootfs_samsung-on7xelte/boot/* .
cp -rv $pmos/chroot_native/home/pmos/rootfs/samsung-on7xelte.img .
cp -rv $pmos/chroot_buildroot_aarch64/var/lib/postmarketos-android-recovery-installer/pmos-samsung-on7xelte.zip .
echo "Done!"
