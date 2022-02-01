#!/bin/bash
pmos="/home/$(whoami)/.local/var/pmbootstrap/cache_git/pmaports/device/testing"
DEVICEPREFIX="samsung-on7xelte"
echo "-> You should 'rm -rv */' first"
echo "-> Generating checksums..."
pmbootstrap checksum device-$DEVICEPREFIX
pmbootstrap checksum firmware-$DEVICEPREFIX
pmbootstrap checksum linux-$DEVICEPREFIX
echo "-> Copying sources..."
cp -rv $pmos/device-$DEVICEPREFIX .
cp -rv $pmos/firmware-$DEVICEPREFIX .
cp -rv $pmos/linux-$DEVICEPREFIX .
echo "-> Done!"
