#!/bin/sh

CWD=$(readlink -f ../)

OPT=""
OPT="$OPT -enable-kvm"
OPT="$OPT -rtc base=localtime"
OPT="$OPT -alt-grab"

# Core
OPT="$OPT -cpu host"
OPT="$OPT -smp 2,cores=2,threads=1,sockets=1"
OPT="$OPT -m 2G"
OPT="$OPT -M q35"

# Graphic
OPT="$OPT -vga qxl"

# Sound
OPT="$OPT -device AC97"

# Drive
OPT="$OPT -drive file=img/snapshot1.img,media=disk,index=0"
#OPT="$OPT -drive file=/home/ahshum/Downloads/Windows10.iso,media=cdrom"
#OPT="$OPT -drive file=/home/ahshum/Downloads/virtio-win-0.1.141.iso,media=cdrom"
#OPT="$OPT -boot order=dc"

# Net
OPT="$OPT -netdev bridge,id=br0"
OPT="$OPT -device virtio-net,netdev=br0"
OPT="$OPT -netdev user,id=netuser,smb=$CWD/share"
OPT="$OPT -device virtio-net,netdev=netuser"

# Pass through
#OPT="$OPT -usb -usbdevice host:046d:c531"
OPT="$OPT -drive file=/dev/sdd,media=disk,index=3,format=raw"

# Boot
export QEMU_AUDIO_DRV=alsa
qemu-system-x86_64 $OPT $@
