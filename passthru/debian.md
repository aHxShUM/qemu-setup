## Deps

`apt-get install ovmf`

## Enable IOMMU

`GRUB_CMDLINE_LINUX_DEFAULT="intel_iommu=on"`

## Load modules on start

add to `/etc/initramfs-tools/modules`

```
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
```

run `update-initramfs`

## Blacklist drivers

add to `/etc/modprobe.d/blacklist.conf`

```
blacklist nouveau
blacklist radeon
blacklist amdgpu
```

## Unbind PCI

add to `/etc/modprobe.d/vfio.conf`

```
options vfio-pci ids=10de:1401,10de:0fba
```
