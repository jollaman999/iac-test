#!/bin/bash

./download_iso.sh

packer build --only=qemu --var iso_url=./Win10_21H2_Korean_x64.iso --var autounattend=./Autounattend.xml windows_10.json

docker run -i --rm \
  -e LIBVIRT_DEFAULT_URI=qemu:///system \
  -v /var/run/libvirt/:/var/run/libvirt/ \
  -v /opt/vagrant.d:/.vagrant.d \
  -v $(realpath "${PWD}"):${PWD} \
  -w $(realpath "${PWD}") \
  --network host \
  vagrantlibvirt/vagrant-libvirt:latest \
  vagrant box add windows10 windows_10_libvirt.box
