#!/bin/sh

CWD=$(readlink -f ../)

OPT=""
OPT="$OPT -enable-kvm"
OPT="$OPT -rtc base=localtime"
OPT="$OPT -alt-grab"

# Core
#OPT="$OPT -cpu host,kvm=off,hv_time,hv_relaxed,hv_vapic,hv_spinlocks=0x1fff,hv_vendor_id=Nvidia43FIX"
OPT="$OPT -cpu host,kvm=off,hv_vendor_id=123456789ab,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time"
OPT="$OPT -smp cores=4,threads=1,sockets=1"
OPT="$OPT -m 8G"
OPT="$OPT -M q35"
OPT="$OPT -bios /usr/share/qemu/OVMF.fd"

# Display
OPT="$OPT -vga std"

# Sound
OPT="$OPT -device AC97"

# Drive
#OPT="$OPT -boot order=dc"
OPT="$OPT -drive file=/vm/gaming/img/gaming.img,if=virtio,format=raw"
#OPT="$OPT -drive file=/home/ahshum/Downloads/Windows10.iso,media=cdrom"
#OPT="$OPT -drive file=/home/ahshum/Downloads/virtio-win-0.1.141.iso,media=cdrom"
OPT="$OPT -drive file=/dev/sdd,format=raw"

# Net
OPT="$OPT -netdev bridge,id=br0"
OPT="$OPT -device virtio-net,netdev=br0,mac=52:54:01:12:34:56"
OPT="$OPT -netdev user,id=netuser,smb=$CWD/share"
OPT="$OPT -device virtio-net,netdev=netuser"

# Passthrough
OPT="$OPT -device virtio-serial-pci"
OPT="$OPT -device vfio-pci,host=01:00.0,multifunction=on"
OPT="$OPT -device vfio-pci,host=01:00.1"
#OPT="$OPT -usb -usbdevice host:046d:c531"

# Run
export QEMU_AUDIO_DRV=alsa
qemu-system-x86_64 $OPT $@
