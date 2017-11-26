#!/bin/sh

OPT=""
OPT="$OPT -enable-kvm"

# Core
OPT="$OPT -cpu host"
OPT="$OPT -smp 4,cores=2,threads=2,sockets=1"
OPT="$OPT -m 4G"
OPT="$OPT -M q35"

# Graphic
OPT="$OPT -vga qxl"

# Sound
OPT="$OPT -soundhw ac97"

# Drive
OPT="$OPT -drive file=img/base.img,media=disk,index=0"
OPT="$OPT -drive file=/home/ahshum/Downloads/Windows10.iso,media=cdrom"
#OPT="$OPT -boot order=dc"

# Net
OPT="$OPT -net nic,model=e1000"
OPT="$OPT -net user,smb=/vm/win10/shared"

# Pass through
#OPT="$OPT -usb -usbdevice host:046d:c531"

# Boot
export QEMU_AUDIO_DRV=alsa
qemu-system-x86_64 $OPT $@
