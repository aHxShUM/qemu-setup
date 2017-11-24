#!/bin/sh

OPT=""
OPT="$OPT -enable-kvm"

# Core
OPT="$OPT -cpu host"
OPT="$OPT -M q35"
OPT="$OPT -m 4G"

# Graphic
OPT="$OPT -vga qxl"

# Drive
OPT="$OPT -drive file=img/base.img,media=disk,index=0"
OPT="$OPT -drive file=/home/ahshum/Downloads/Windows10.iso,media=cdrom"

# Net
OPT="$OPT -net nic,model=e1000"
OPT="$OPT -net user,smb=/vm/win10/shared"

qemu-system-x86_64 $OPT $@
