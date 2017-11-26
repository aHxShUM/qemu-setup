#!/bin/sh

# Notes: [1]: the *hci_hcd kernel drivers typically control the USB ports.
# ohci_hcd and uhci_hcd are for USB1.1 ports,
# ehci_hcd is for USB2 ports and
# xhci_hcd is for USB3 ports.

for i in /sys/bus/pci/drivers/[uoex]hci_hcd/*:*; do
  echo "${i##*/}" > "${i%/*}/unbind"
  echo "${i##*/}" > "${i%/*}/bind"
done
