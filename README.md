# postmarketOS Device Trees for on7xelte
## How to use:
1.
```
git clone https://github.com/LinuxForExy7870/pmos-samsung-on7xelte.git
cd pmos-samsung-on7xelte
```
2. Do `pmbootstrap init` and `Control + C` quit after git clone had completed.
3. `cp -rv device-samsung-on7xelte firmware-samsung-on7xelte linux-samsung-on7xelte ~/.local/var/pmbootstrap/cache_git/pmaports/device/testing/`
4. `pmbootstrap init` with:
```
Channel: edge
Vendor: samsung
Codename: on7xelte
User interface: xfce4
Extra packages: msm-fb-refresher # untested, but recommended.
```
5. `pmbootstrap install --android-recovery-zip`
6. `pmbootstrap export`
7. `cp /tmp/postmarketOS-export/* .`
8. Follow instructions given here to flash it: `https://forum.xda-developers.com/t/dev-linux-alpha-build-released-postmarketos-for-g610f.4392165/`

Contributions are welcome. Please make the pull in the `next` branch. Please test it before making a pull as we have only 2 people handling the whole testing situation and have our own stuff to do. :)
