#!/bin/bash
DIRPREFIX="/home/$(whoami)/.local/var/pmbootstrap/cache_git/pmaports/device/testing"
DEVICEPREFIX="samsung-on7xelte"
echo "-> You should 'rm -rv */' first"
echo "-> Generating checksums..."
pmbootstrap checksum device-$DEVICEPREFIX
pmbootstrap checksum firmware-$DEVICEPREFIX
pmbootstrap checksum linux-$DEVICEPREFIX
echo "-> Copying sources..."
cp -rv $DIRPREFIX/device-$DEVICEPREFIX .
cp -rv $DIRPREFIX/firmware-$DEVICEPREFIX .
cp -rv $DIRPREFIX/linux-$DEVICEPREFIX .
echo "-> Done!"
