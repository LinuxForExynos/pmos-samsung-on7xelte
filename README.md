# postmarketOS Device Trees for on7xelte
## How to use:
#### PLEASE CHANGE ALL THINGS IN THIS REPO WHICH USE THE VARIABLE `$pmos` TO YOUR POSTMARKETOS SOURCE DIRECTORY (i.e. The directory you gave pmbootstrap init when it asked for a directory. Most commonly `/home/yourusername/.local/var/pmbootstrap/`. To put it in the scripts, you may do something like `pmos=/home/user/pmos`. For commands given below, just replace them with the directory)
### Either use the auto.sh file or follow below instructions:
1. Download the folders, either by downloading the zip or cloning it.
2. Do `pmbootstrap init` with the following parameters:

```
Channel: edge
Device Architecture: aarch64 
Manufacturer: samsung
Codename: on7xelte
New Port: y (you have to do this as we haven't pushed to upstream yet)
Official Name: Galaxy J7 Prime
Release Date: 2016
Hardware Keyboard: n
External Storage: y
Flash Method: Heimdall
Type: bootimg
Bootimg Path: skip this by pressing enter
Username: your preffered username
UI: your preffered UI
Additional Options: Don't change anything but if you want you can change the CCACHE and Job value
Extra Packages: (recommended) vim,neofetch
TZ: your choice
Default Locale: C.UTF-8
Device Hostname: on7xelte
SSH Keys: your choice
Build outdated packages: y

```
3. After initialization, do `pmbootstrap chroot` and make a directory in `/home/pmos` named `dtb`
4. Go where you downloaded this repo and do `sudo cp dtb/*.dtb $pmos/chroot_native/home/pmos/dtb`
5. Do 

```
rm -rf $pmos/cache_git/pmaports/devices/testing/linux-samsung-on7xelte
rm -rf $pmos/cache_git/pmaports/devices/testing/device-samsung-on7xelte
```
6. Now do `cp -r * $pmos/cache_git/pmaports/devices/testing/` from the directory where you cloned this repo
7. Do `pmbootstrap checksum linux-samsung-on7xelte && pmbootstrap checksum firmware-samsung-on7xelte && pmbootstrap checksum device-samsung-on7xelte`
8. To build, do `pmbootstrap build linux-samsung-on7xelte --force && pmbootstrap build firmware-samsung-on7xelte --force && pmbootstrap build device-samsung-on7xelte`
9. After it as built export it as a zip file by doing `pmbootstrap install --android-recovery-zip && pmbootstrap export`
10. To finally copy over the files to your phone, first copy the files to some directory with the `fetchexport.sh` file given. Remember to change the $pmos dir to your postmarketOS source directory (i.e. the directory you gave pmbootstrap while doing `pmbootstrap init`). 
11. Follow instructions given here to flash it: https://forum.xda-developers.com/t/dev-linux-alpha-build-released-postmarketos-for-g610f.4392165/

Contributions are welcome. Please make the pull in the `next` branch. Please test it before making a pull as we have only 2 people handling the whole testing situation and have our own stuff to do. :)
