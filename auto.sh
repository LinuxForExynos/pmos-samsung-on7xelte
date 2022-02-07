#!/usr/bin/env bash
echo " _     _                  _____         _____ ___ _____ ___  
| |   (_)_ __  _   ___  _|  ___|__  _ _|___  ( _ )___  / _ \ 
| |   | | '_ \| | | \ \/ / |_ / _ \| '__| / // _ \  / / | | |
| |___| | | | | |_| |>  <|  _| (_) | |   / /| (_) |/ /| |_| |
|_____|_|_| |_|\__,_/_/\_\_|  \___/|_|  /_/  \___//_/  \___/ 
"
echo "                 _                        _        _    ___  ____  
 _ __   ___  ___| |_ _ __ ___   __ _ _ __| | _____| |_ / _ \/ ___| 
| '_ \ / _ \/ __| __| '_  _  \ / _  | '__| |/ / _ \ __| | | \___ \ 
| |_) | (_) \__ \ |_| | | | | | (_| | |  |   <  __/ |_| |_| |___) |
| .__/ \___/|___/\__|_| |_| |_|\__,_|_|  |_|\_\___|\__|\___/|____/ 
|_|                                                                
    _         _                          _             
   / \  _   _| |_ _____      _____  _ __| | _____ _ __ 
  / _ \| | | | __/ _ \ \ /\ / / _ \| '__| |/ / _ \ '__|
 / ___ \ |_| | || (_) \ V  V / (_) | |  |   <  __/ |   
/_/   \_\__,_|\__\___/ \_/\_/ \___/|_|  |_|\_\___|_|  "

if [ "$CI" = "true" ]; then
    echo "\nCI Process detected";
    CI_PMBTSP="/root/.local/var/pmbootstrap"
    CI_PM_EXTRA_ARGS="--as-root";
else 
    CI_PMBTSP="$HOME/.local/var/pmbootstrap";
fi
echo "Using installation $CI_PMBTSP"


echo " "
echo "You will be asked for SUDO/DOAS password"
sudo pacman -Syu --noconfirm
echo " "
echo "Copying Source Trees"
echo " "
rm -rf $CI_PMBTSP/cache_git/pmaports/device/testing/linux-samsung-on7xelte
rm -rf $CI_PMBTSP/cache_git/pmaports/device/testing/device-samsung-on7xelte
cp -r linux-samsung-on7xelte $CI_PMBTSP/cache_git/pmaports/device/testing/
cp -r device-samsung-on7xelte $CI_PMBTSP/cache_git/pmaports/device/testing/
cp -r firmware-samsung-on7xelte $CI_PMBTSP/cache_git/pmaports/device/testing/

echo " "
echo "Doing Checksums"
echo " "
pmbootstrap $CI_PM_EXTRA_ARGS checksum linux-samsung-on7xelte 
pmbootstrap $CI_PM_EXTRA_ARGS checksum firmware-samsung-on7xelte
pmbootstrap $CI_PM_EXTRA_ARGS checksum device-samsung-on7xelte

echo " "
echo "Building All"
echo " "
pmbootstrap $CI_PM_EXTRA_ARGS build linux-samsung-on7xelte --force 
pmbootstrap $CI_PM_EXTRA_ARGS build firmware-samsung-on7xelte --force 
pmbootstrap $CI_PM_EXTRA_ARGS build device-samsung-on7xelte --force

echo " "
echo "Exporting"
echo " "
pmbootstrap $CI_PM_EXTRA_ARGS install --android-recovery-zip --password 12345
pmbootstrap $CI_PM_EXTRA_ARGS export

echo " "
echo "Copying to $PWD"
echo " "

cp -rv $CI_PMBTSP/chroot_rootfs_samsung-on7xelte/boot/* .
cp -rv $CI_PMBTSP/chroot_native/home/pmos/rootfs/samsung-on7xelte.img .
cp -rv $CI_PMBTSP/chroot_buildroot_aarch64/var/lib/postmarketos-android-recovery-installer/pmos-samsung-on7xelte.zip 
			
echo " "
echo "Done! Flash with the instructions given on https://forum.xda-developers.com/t/dev-linux-alpha-build-released-postmarketos-for-g610f.4392165/"
echo " "
