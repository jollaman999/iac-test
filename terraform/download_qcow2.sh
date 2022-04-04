#!/bin/bash

wget -c "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img" -O ubuntu-focal.qcow2.origin
qemu-img convert -f qcow2 -O qcow2 ubuntu-focal.qcow2.origin ubuntu-focal.qcow2
qemu-img resize ubuntu-focal.qcow2 ${DISK_SIZE}
