#!/bin/sh

OPT=""
OPT="$OPT -enable-kvm"
OPT="$OPT -localtime"

# Core
#OPT="$OPT -cpu host,kvm=off,hv_time,hv_relaxed,hv_vapic,hv_spinlocks=0x1fff,hv_vendor_id=Nvidia43FIX"
OPT="$OPT -cpu host,kvm=off,hv_vendor_id=123456789ab"
OPT="$OPT -smp cores=4,threads=1,sockets=1"
OPT="$OPT -m 6G"
OPT="$OPT -M q35"
OPT="$OPT -bios /usr/share/qemu/OVMF.fd"

# Display
OPT="$OPT -vga qxl"
OPT="$OPT -sdl"

# Sound
OPT="$OPT -soundhw ac97"

# Drive
#OPT="$OPT -boot order=dc"
OPT="$OPT -drive file=/vm/gaming/img/gaming.img,if=virtio,format=qcow2"
#OPT="$OPT -drive file=/home/ahshum/Downloads/Windows10.iso,media=cdrom"
#OPT="$OPT -drive file=/home/ahshum/Downloads/virtio-win-0.1.141.iso,media=cdrom"

# Net
OPT="$OPT -net nic,model=e1000"
OPT="$OPT -net user,smb=/vm/gaming/shared"

# Passthrough
OPT="$OPT -device virtio-serial-pci"
OPT="$OPT -device vfio-pci,host=01:00.0,multifunction=on"
OPT="$OPT -device vfio-pci,host=01:00.1"
#OPT="$OPT -usb -usbdevice host:046d:c531"

# Run
export QEMU_AUDIO_DRV=alsa
qemu-system-x86_64 $OPT $@
